class AuthModel {
  final String? phone;
  final String? password;
  final String? displayName;
  final String? experienceYears;
  final String? address;
  final String? level;

  AuthModel({
    required this.phone,
    required this.password,
    required this.displayName,
    required this.experienceYears,
    required this.address,
    required this.level,
  });
  factory AuthModel.fromJson(Map<String, dynamic>? jsonData) {
    return AuthModel(
      phone: jsonData?['phone'],
      password: jsonData?['password'],
      displayName: jsonData?['displayName'],
      experienceYears: jsonData?['experienceYears'],
      address: jsonData?['address'],
      level: jsonData?['level'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'password': password,
      'displayName': displayName,
      'experienceYears': experienceYears,
      'address': address,
      'level': level,
    };
  }
}
