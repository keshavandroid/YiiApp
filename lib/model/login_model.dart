
import 'package:yii_app/model/userdata_model.dart';

class LoginModel {
  final int status;
  final String message;
  final UserdataModel result;

  LoginModel({
    required this.status,
    required this.message,
    required this.result,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'] as int,
      message: json['message'] as String,
      result: UserdataModel.fromJson(json['result'] as Map<String, dynamic>),
    );
  }
} 