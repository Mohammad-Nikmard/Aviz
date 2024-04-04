import 'package:dio/dio.dart';

class ApiException implements Exception {
  String? message;
  int? errorCode;
  Response? response;

  ApiException(this.message, this.errorCode, {this.response}) {
    if (errorCode != 400) {
      return;
    } else if (message == "Failed to authenticate.") {
      message = "نام کاربری یا رمز عبور اشتباه است.";
    }
  }
}
