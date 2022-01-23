class Data {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String image;

  Data({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      image: json['image'],
    );
  }
}
