class Clinic {
  final String name;
  final String address;
  final String phone;
  final String email;

  Clinic({
    this.name,
    this.address,
    this.phone,
    this.email,
  });

  factory Clinic.fromJson(Map<dynamic, dynamic> json) {
    final String name = json['name'];
    final String address = json['address'];
    final String phone = json['phone'];
    final String email = json['email'];
    return Clinic(
      name: name,
      address: address,
      phone: phone,
      email: email,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
    };
  }

  @override
  String toString() =>
      ' name: $name ,   address:$address, phone: $phone, email: $email,';
}
