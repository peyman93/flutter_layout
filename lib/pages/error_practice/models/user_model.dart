class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    this.fatherName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        fatherName: json['fatherName'],
      );

  final int id;
  final String name;
  final String phone;
  final String? fatherName;
}
