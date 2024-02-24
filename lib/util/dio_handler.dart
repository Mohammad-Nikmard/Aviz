import 'package:dio/dio.dart';

class DioHandler {
  static Dio dioWithoutHeader() {
    return Dio(
      BaseOptions(
        baseUrl: "https://startflutter.ir/",
      ),
    );
  }
}
