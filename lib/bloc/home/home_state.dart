import 'package:aviz/data/model/promotion.dart';
import 'package:dartz/dartz.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeResponseState extends HomeState {
  Either<String, List<Promotion>> promotionHotList;
  Either<String, List<Promotion>> recentPromotionList;

  HomeResponseState(this.promotionHotList, this.recentPromotionList);
}
