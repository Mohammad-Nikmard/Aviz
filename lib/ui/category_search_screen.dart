import 'package:aviz/data/model/promotion.dart';
import 'package:aviz/widget/hot_aviz_widget.dart';
import 'package:aviz/widget/recent_aviz_post.dart';
import 'package:flutter/material.dart';

class CategorySearch extends StatelessWidget {
  const CategorySearch(
      {super.key, required this.title, required this.promotionList});
  final String title;
  final List<Promotion> promotionList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (promotionList[index].isHot) {
                      return Directionality(
                        textDirection: TextDirection.rtl,
                        child: HotAvizWidget(
                          promotion: promotionList[index],
                        ),
                      );
                    } else {
                      return RecentAvizPost(
                        promotion: promotionList[index],
                      );
                    }
                  },
                  childCount: promotionList.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
