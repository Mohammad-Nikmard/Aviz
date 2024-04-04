import 'package:aviz/bloc/home/home_bloc.dart';
import 'package:aviz/bloc/home/home_event.dart';
import 'package:aviz/bloc/home/home_state.dart';
import 'package:aviz/constants/color_constants.dart';
import 'package:aviz/data/model/promotion.dart';
import 'package:aviz/ui/category_search_screen.dart';
import 'package:aviz/widget/hot_aviz_widget.dart';
import 'package:aviz/widget/recent_aviz_post.dart';
import 'package:aviz/widget/shimmer_skelton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[200]!,
            child: const HomeLoading(),
          );
        }
        if (state is HomeResponseState) {
          return Scaffold(
            backgroundColor: Colors.white,
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
                child: RefreshIndicator(
                  onRefresh: () async {
                    context.read<HomeBloc>().add(HomeDataRequestEvent());
                  },
                  color: ProjectColors.redColor,
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

class HomeLoading extends StatelessWidget {
  const HomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: ShimmerSkelton(
                  height: 20,
                  radius: 5,
                  width: 100,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerSkelton(
                      height: 20,
                      radius: 5,
                      width: 90,
                    ),
                    ShimmerSkelton(
                      height: 20,
                      radius: 5,
                      width: 150,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 267,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  children: const [
                    ShimmerSkelton(
                      height: 267,
                      radius: 10,
                      width: 224,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: ShimmerSkelton(
                        height: 267,
                        radius: 10,
                        width: 224,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerSkelton(
                      height: 20,
                      radius: 5,
                      width: 90,
                    ),
                    ShimmerSkelton(
                      height: 20,
                      radius: 5,
                      width: 150,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 300,
                child: ListView(
                  children: [
                    ShimmerSkelton(
                      height: 139,
                      radius: 10,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: ShimmerSkelton(
                        height: 139,
                        radius: 10,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
