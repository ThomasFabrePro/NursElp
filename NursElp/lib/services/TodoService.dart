import 'package:NursElp/models/TodoModel.dart';
import 'package:NursElp/widgets/CardWidgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TodoService {
  CollectionReference todos = FirebaseFirestore.instance.collection('todos');
  Future<String> addTodo(
    String taskId,
    String title,
  ) async {
    String todoId;
    String key = UniqueKey().toString();

    todos.add({
      'isDone': false,
      'taskId': taskId,
      'todoId': key,
      'title': title,
    });

    return todos
        .where('todoId', isEqualTo: key)
        .get()
        .then((QuerySnapshot querySnapshot) {
      todoId = querySnapshot.docs.single.id;
      querySnapshot.docs.single.reference.update({
        'todoId': todoId,
      });
      return todoId;
    });
  }

  void updateTodo(String todoId, String field, var value) {
    DocumentReference surveillance =
        FirebaseFirestore.instance.collection('todos').doc(todoId);
    surveillance.update({field: value});
  }

  void deleteTodo(String todoId) {
    DocumentReference todo =
        FirebaseFirestore.instance.collection('todos').doc(todoId);
    todo.delete();
  }
}

class GetTodos extends StatefulWidget {
  final String taskId;
  const GetTodos({Key key, this.taskId}) : super(key: key);

  @override
  _GetTodosState createState() => _GetTodosState();
}

class _GetTodosState extends State<GetTodos> {
  String taskId;
  final ScrollController scrollController = ScrollController();
  CollectionReference todos = FirebaseFirestore.instance.collection('todos');
  @override
  void initState() {
    super.initState();
    taskId = widget.taskId;
  }

  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      isAlwaysShown: true,
      child: StreamBuilder<QuerySnapshot>(
        stream: todos
            .where('taskId', isEqualTo: taskId)
            .snapshots(includeMetadataChanges: true),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('erreur');
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Icon(Icons.autorenew),
            );
          }

          return ListView(
            controller: scrollController,
            children: snapshot.data.docs.map(
              (DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document?.data() as Map<String, dynamic>;
                return TodoWidget(
                  todo: Todo.fromJson(data),
                );
              },
            ).toList(),
          );
        },
      ),
    );
  }
}
