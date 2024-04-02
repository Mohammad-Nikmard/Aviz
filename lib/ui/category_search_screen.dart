import 'package:flutter/material.dart';

class CategorySearch extends StatelessWidget {
  const CategorySearch({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: const SafeArea(
        child: CustomScrollView(
          slivers: [],
        ),
      ),
    );
  }
}
