import 'package:aviz/bloc/home/home_event.dart';
import 'package:aviz/bloc/home/home_state.dart';
import 'package:aviz/data/repository/promotion_repository.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Promotionrepository _promotionRepository;
  HomeBloc(this._promotionRepository) : super(HomeInitState()) {
    on<HomeDataRequestEvent>(
      (event, emit) async {
        emit(HomeLoadingState());
        var hotPromotionList = await _promotionRepository.getHotPromotions();
        var recentPromotionList =
            await _promotionRepository.getRecentPromotions();
        emit(HomeResponseState(hotPromotionList, recentPromotionList));
      },
    );
  }
}
