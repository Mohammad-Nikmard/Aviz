import 'package:aviz/data/model/promotion.dart';
import 'package:aviz/util/api_exception.dart';
import 'package:dio/dio.dart';

abstract class PromotionDatasource {
  Future<List<Promotion>> getpromotionList();
  Future<List<Promotion>> getHotPromotions();
}

class PromotionRemoteDatasource extends PromotionDatasource {
  final Dio _dio;

  PromotionRemoteDatasource(this._dio);
  @override
  Future<List<Promotion>> getpromotionList() async {
    try {
      var response = await _dio.get("api/collections/promotion/records");
      return response.data["items"]
          .map<Promotion>((jsonMapObject) => Promotion.withJson(jsonMapObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.message, ex.response?.statusCode,
          response: ex.response);
    } catch (ex) {
      throw ApiException("error", 0);
    }
  }

  @override
  Future<List<Promotion>> getHotPromotions() async {
    Map<String, dynamic> qparams = {
      "filter": "is_hot=false",
    };
    try {
      var response = await _dio.get("api/collections/promotion/records",
          queryParameters: qparams);
      return response.data["items"]
          .map<Promotion>((jsonMapObject) => Promotion.withJson(jsonMapObject))
          .toLost();
    } on DioException catch (ex) {
      throw ApiException(ex.message, ex.response?.statusCode);
    }
  }
}
