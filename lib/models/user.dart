class User {
  int? id;
  String? nick;
  String? password;

  User({this.id, required this.nick, required this.password});

  Map<String, dynamic> toMap() {
    return {'id': id, 'nick': nick, 'password': password};
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      nick: map['nick'],
      password: map['password'],
    );
  }
}