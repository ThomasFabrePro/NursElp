import 'dart:ffi';

class Contact {
  final int id;
  final String name;
  final String firstName;
  final Array phoneNumber;
  final String profession;

  Contact(
      {this.id, this.name, this.firstName, this.phoneNumber, this.profession});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'firstName': firstName,
      'phoneNumber': phoneNumber,
      'profession': profession,
    };
  }
}
