
import 'package:yii_app/model/userdata_model.dart';

class RegisterModel {
  final int status;
  final String message;
  final UserdataModel result;

  RegisterModel({
    required this.status,
    required this.message,
    required this.result,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      status: json['status'] as int,
      message: json['message'] as String,
      result: UserdataModel.fromJson(json['result'] as Map<String, dynamic>),
    );
  }
} 