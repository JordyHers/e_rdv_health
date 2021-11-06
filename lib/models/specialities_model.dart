class Specialities {
  final int id;
  final String libelle;
  final int clinique;
  final String createdAt;
  final String updatedAt;

  Specialities({
    required this.id,
    required this.libelle,
    required this.clinique,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Specialities.fromJson(Map<dynamic, dynamic> json) {
    final int id = json['id'];
    final String libelle = json['libelle'];
    final int clinique = json['clinique'];
    final String createdAt = json['created_at'];
    final String updatedAt = json['updated_at'];
    return Specialities(
      id: id,
      libelle: libelle,
      clinique: clinique,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'libelle': libelle,
      'clinique': clinique,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  @override
  String toString() =>
      ' id: $id ,   libelle :$libelle,clinique: $clinique, created_at: $createdAt, updated_at: $updatedAt,';
}
