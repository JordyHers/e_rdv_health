class User {
  final String name;
  final int age;
  final String gender;

  User({this.name, this.age, this.gender});

  factory User.fromJson(Map<dynamic, dynamic> json) {
    final String name = json['name'];
    final int age = json['age'];
    final String gender = json['gender'];
    return User(name: name, age: age, gender: gender);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'gender': gender,
    };
  }

  @override
  String toString() => ' name: $name , gender:$gender, age:$age ';
}
