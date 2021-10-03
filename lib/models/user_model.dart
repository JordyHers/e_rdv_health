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
      {this.name,
      this.address,
      this.gender,
      this.phone,
      this.email,
      this.password,
      this.profile,
      this.surname});

  factory User.fromJson(Map<dynamic, dynamic> json) {
    final String name = json['name'];
    final String surname = json['surname'];
    final String gender = json['gender'];
    final String address = json['address'];
    final String phone = json['phone'];
    final String profile = json['profile'];
    final String email = json['email'];
    final String password = json['password'];
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
