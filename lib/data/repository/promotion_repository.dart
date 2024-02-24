import 'package:aviz/data/datasource/promotion_datasource.dart';
import 'package:aviz/data/model/promotion.dart';
import 'package:aviz/util/api_exception.dart';
import 'package:dartz/dartz.dart';

abstract class Promotionrepository {
  Future<Either<String, List<Promotion>>> getpromotionList();
  Future<Either<String, List<Promotion>>> getHotPromotions();
}

class PromotionRemoteRepository extends Promotionrepository {
  final PromotionDatasource _datasource;

  PromotionRemoteRepository(this._datasource);
  @override
  Future<Either<String, List<Promotion>>> getpromotionList() async {
    try {
      var response = await _datasource.getpromotionList();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message!);
    }
  }

  @override
  Future<Either<String, List<Promotion>>> getHotPromotions() async {
    try {
      var response = await _datasource.getHotPromotions();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message!);
    }
  }
}
