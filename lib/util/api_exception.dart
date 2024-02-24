import 'package:dio/dio.dart';

class ApiException implements Exception {
  String? message;
  int? errorCode;
  Response? response;

  ApiException(this.message, this.errorCode, {this.response}) {
    if (errorCode != 400) {
      return;
    } else if (message == "") {}
  }
}
