class User {
  final String name;
  final int age;
  final String gender;

  User(this.name, this.age, this.gender);
}

class MockData {
  List<User> _users = [];

  /// Cette ligne de code rend la liste accessible
  List<User> get userList => _users;

  Future<List<User>> createUsers() async {
    for (int i = 0; i < 10; i++) {
      var newUser = User('Michael', 26, 'male');
      _users.add(newUser);
    }
    return _users;
  }
}
