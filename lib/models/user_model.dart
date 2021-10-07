class User {
  final String name;
  final String surname;
  final String address;
  final String gender;
  final String profile;
  final String phone;
  final String email;
  final String password;

  User(
      {required this.name,
      required this.address,
      required this.gender,
      required this.phone,
      required this.email,
      required this.password,
      required this.profile,
      required this.surname});

  factory User.fromJson(Map<dynamic, dynamic> json) {
    final String name = json['user']['name'];
    final String surname = json['user']['surname'];
    final String gender = json['user']['gender'];
    final String address = json['user']['address'];
    final String phone = json['user']['phone'];
    final String profile = json['user']['profile'];
    final String email = json['user']['email'];
    final String password = json['user']['password'];
    return User(
        name: name,
        address: address,
        gender: gender,
        surname: surname,
        phone: phone,
        profile: profile,
        email: email,
        password: password);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'address': address,
      'gender': gender,
      'phone': phone,
      'profile': profile,
      'email': email,
      'password': password,
    };
  }

  @override
  String toString() =>
      ' name: $name , surname:$surname, gender:$gender, address:$address,profile: $profile , phone: $phone, email: $email,password: $password ';
}
