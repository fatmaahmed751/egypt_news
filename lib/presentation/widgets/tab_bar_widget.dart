import 'package:egypt_news/presentation/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  final List<String> tabs;
  final Function(int)? onTap;
  const TabBarWidget({
    Key? key,
    required this.tabs,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: TabBar(
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        labelColor: Colors.black,
        unselectedLabelColor: AppColors.GREY,
        labelPadding: const EdgeInsetsDirectional.only(end: 16),
        physics: const BouncingScrollPhysics(),
        indicatorWeight: 4.0,
        indicatorPadding: const EdgeInsetsDirectional.only(end: 30),
        isScrollable: true,
        onTap: onTap,
        tabs: tabs.map((tab) => Tab(text: tab)).toList(),
      ),
    );
  }
}

