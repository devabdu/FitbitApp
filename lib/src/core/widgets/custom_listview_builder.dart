import 'package:flutter/material.dart';

class CustomListViewBuilder extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  const CustomListViewBuilder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
