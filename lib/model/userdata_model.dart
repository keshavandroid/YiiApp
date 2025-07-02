
class UserdataModel {
  final int userId;
  final String userName;
  final String userToken;
  final String email;
  final String phoneNumber;
  final String otp;
  final String countryId;

  UserdataModel({
    required this.userId,
    required this.userName,
    required this.userToken,
    required this.email,
    required this.phoneNumber,
    required this.otp,
    required this.countryId,
  });

  factory UserdataModel.fromJson(Map<String, dynamic> json) {
    return UserdataModel(
      userId: json['userId'],
      userName: json['userName'],
      userToken: json['userToken'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      otp: json['otp'].toString(),
      countryId: json['countryId'].toString(),
    );
  }
} 