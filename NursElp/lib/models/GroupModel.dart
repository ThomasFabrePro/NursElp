class GroupModel {
  final String groupId;
  final String groupName;

  GroupModel(this.groupId, this.groupName);

  Map<String, dynamic> toJson() => {
        'groupId': groupId,
        'groupName': groupName,
      };
}
