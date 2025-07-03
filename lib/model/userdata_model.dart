
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

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userName': userName,
      'email': email,
      'userToken':userToken,
      'phoneNumber':phoneNumber,
      'otp':otp,
      'countryId':countryId
    };
  }

  factory UserdataModel.fromMap(Map<String, dynamic> map) {
    return UserdataModel(
      userId: map['userId'],
      userName: map['userName'],
      email: map['email'],
      userToken: map['userToken'],
      phoneNumber: map['phoneNumber'],
      otp: map['otp'].toString(),
      countryId: map['countryId'].toString(),
    );
  }

} 