class User {
  String name = "";
  String email = "";

  User(this.name, this.email);
  User.fromMap(Map map) {
    name = map[name];
    email = map[email];
  }
}
