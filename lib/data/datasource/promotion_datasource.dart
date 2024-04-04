import 'package:aviz/data/model/promotion.dart';
import 'package:aviz/util/api_exception.dart';
import 'package:dio/dio.dart';

abstract class PromotionDatasource {
  Future<List<Promotion>> getHotPromotions();
  Future<List<Promotion>> getRecentPromotions();
}

class PromotionRemoteDatasource extends PromotionDatasource {
  final Dio _dio;

  PromotionRemoteDatasource(this._dio);

  @override
  Future<List<Promotion>> getHotPromotions() async {
    Map<String, dynamic> qparams = {
      "filter": "is_hot=true",
    };
    try {
      var response = await _dio.get("api/collections/promotion/records",
          queryParameters: qparams);
      return response.data["items"]
          .map<Promotion>((jsonMapObject) => Promotion.withJson(jsonMapObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.message, ex.response?.statusCode);
    } catch (ex) {
      throw ApiException("$ex", 0);
    }
  }

  @override
  Future<List<Promotion>> getRecentPromotions() async {
    Map<String, dynamic> promotionQuery = {'filter': "is_hot=false"};
    try {
      var response = await _dio.get(
        "api/collections/promotion/records",
        queryParameters: promotionQuery,
      );
      return response.data["items"]
          .map<Promotion>((jsonMapObject) => Promotion.withJson(jsonMapObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.data["message"], ex.response?.statusCode);
    } catch (ex) {
      throw ApiException("$ex", 1);
    }
  }
}
