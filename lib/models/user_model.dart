class UserModel {
  final String userName;
  final String email;
  final String phoneNumber;
  bool isAdmin;
  UserModel({
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.isAdmin,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['userName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      isAdmin: json['isAdmin'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
      'phoneNumber': phoneNumber,
      'isAdmin': isAdmin,
    };
  }
}
