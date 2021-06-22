class UserModel {
  final String email;
  final String password;
  String uid;
  String nickname;

  UserModel({
    this.uid,
    this.email,
    this.password,
    this.nickname,
  });

  set setUid(value) => uid = value;
  set setNickname(value) => nickname = value;

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'password': password,
        'nickname': nickname,
      };
}
