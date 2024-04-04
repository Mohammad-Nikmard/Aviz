import 'package:aviz/bloc/home/home_bloc.dart';
import 'package:aviz/bloc/home/home_state.dart';
import 'package:aviz/data/model/promotion.dart';
import 'package:aviz/ui/category_search_screen.dart';
import 'package:aviz/widget/hot_aviz_widget.dart';
import 'package:aviz/widget/recent_aviz_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const CircularProgressIndicator();
        }
        if (state is HomeResponseState) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 243, 243, 243),
            appBar: AppBar(
              scrolledUnderElevation: 0,
              centerTitle: true,
              title: SvgPicture.asset(
                'assets/images/icon_aviz.svg',
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomScrollView(
                  slivers: [
                    state.promotionHotList.fold(
                      (exceptionMessage) {
                        return SliverToBoxAdapter(
                          child: Text(
                            exceptionMessage,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        );
                      },
                      (hotList) {
                        return SliverPadding(
                          padding: const EdgeInsets.only(top: 20),
                          sliver: ListHeader(
                            title: "آویز های داغ",
                            promotionList: hotList,
                          ),
                        );
                      },
                    ),
                    state.promotionHotList.fold(
                      (exceptionMessage) {
                        return SliverToBoxAdapter(
                          child: Text(
                            exceptionMessage,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        );
                      },
                      (promotList) {
                        return HotPostList(
                          hotPromotions: promotList,
                        );
                      },
                    ),
                    state.recentPromotionList.fold(
                      (exceptionMessage) {
                        return SliverToBoxAdapter(
                          child: Text(
                            exceptionMessage,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        );
                      },
                      (recentList) {
                        return ListHeader(
                          title: "آویز های اخیر",
                          promotionList: recentList,
                        );
                      },
                    ),
                    state.recentPromotionList.fold(
                      (exceptionMessage) {
                        return SliverToBoxAdapter(
                          child: Text(
                            exceptionMessage,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        );
                      },
                      (recentPromotList) {
                        return RecentPostList(
                          recentPromotionList: recentPromotList,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const Text("");
      },
    );
  }
}

class ListHeader extends StatelessWidget {
  const ListHeader(
      {super.key, required this.title, required this.promotionList});
  final String title;
  final List<Promotion> promotionList;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CategorySearch(
                      title: title,
                      promotionList: promotionList,
                    ),
                  ),
                );
              },
              child: Text(
                "مشاهده همه",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class HotPostList extends StatelessWidget {
  const HotPostList({super.key, required this.hotPromotions});
  final List<Promotion> hotPromotions;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 287,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
            itemCount: hotPromotions.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 20),
                child: HotAvizWidget(
                  promotion: hotPromotions[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class RecentPostList extends StatelessWidget {
  const RecentPostList({super.key, required this.recentPromotionList});
  final List<Promotion> recentPromotionList;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: RecentAvizPost(
              promotion: recentPromotionList[index],
            ),
          );
        },
        childCount: recentPromotionList.length,
      ),
    );
  }
}
