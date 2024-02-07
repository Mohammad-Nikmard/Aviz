import 'package:aviz/widget/hot_aviz_widget.dart';
import 'package:aviz/widget/recent_aviz_post.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/images/icon_header.png"),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            slivers: [
              ListHeader(title: "آویز های داغ"),
              HotPostList(),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              ListHeader(title: "آویز های اخیر"),
              RecentPostList(),
            ],
          ),
        ),
      ),
    );
  }
}

class ListHeader extends StatelessWidget {
  const ListHeader({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "مشاهده همه",
              style: Theme.of(context).textTheme.bodySmall,
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
  const HotPostList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: SizedBox(
          height: 267,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: HotAvizWidget(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class RecentPostList extends StatelessWidget {
  const RecentPostList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: RecentAvizPost(),
          );
        },
        childCount: 10,
      ),
    );
  }
}
