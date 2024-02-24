import 'package:aviz/data/datasource/promotion_datasource.dart';
import 'package:aviz/data/repository/promotion_repository.dart';
import 'package:aviz/util/dio_handler.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

Future<void> initServiceLocator() async {
  getComponents();
  getDatasources();
  getRepositories();
}

void getDatasources() {
  locator.registerSingleton<PromotionDatasource>(
      PromotionRemoteDatasource(locator.get()));
}

void getRepositories() {
  locator.registerSingleton<Promotionrepository>(
      PromotionRemoteRepository(locator.get()));
}

void getComponents() {
  locator.registerSingleton<Dio>(DioHandler.dioWithoutHeader());
}
