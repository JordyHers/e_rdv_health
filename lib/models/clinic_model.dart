import 'package:e_rdv_health/models/specialities_model.dart';

class Clinic {
  final int id;
  final String name;
  final String address;
  final String phone;
  final String email;
  final String createdAt;
  final String updatedAt;
  final List<Specialities>? specialities;

  Clinic({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    this.specialities,
  });

  factory Clinic.fromJson(Map<dynamic, dynamic> json) {
    final int id = json['id'];
    final String name = json['nom'];
    final String address = json['addresse'];
    final String phone = json['phone'];
    final String email = json['email'];
    final String createdAt = json['created_at'];
    final String updatedAt = json['updated_at'];
    final List<Specialities>? specialities = json['specialities'];
    return Clinic(
        id: id,
        name: name,
        address: address,
        phone: phone,
        email: email,
        createdAt: createdAt,
        updatedAt: updatedAt,
        specialities: parseSpecialities(specialities ?? [], json));
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'specialities': specialities
    };
  }

  @override
  String toString() =>
      ' name: $name ,   address:$address, phone: $phone, email: $email,    createdAt: $createdAt, updatedAt: $updatedAt, specialities: $specialities';
}

parseSpecialities(List<Specialities> specialities, json) {
  if (specialities.isNotEmpty) {
    specialities.map<Specialities>((e) => Specialities.fromJson(json)).toList();
  } else {
    print(specialities);
  }
}
