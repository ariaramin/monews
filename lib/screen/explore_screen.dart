import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:monews/constants/constants.dart';
import 'package:monews/repository.dart';
import 'package:monews/widgets/news_horizontal_widget.dart';
import 'package:monews/widgets/news_widget.dart';
import 'package:monews/widgets/section_title.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: _getAppBar(),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverPadding(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    sliver: SliverAppBar(
                      backgroundColor: whiteColor,
                      title: _getTabBar(context),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  _getTabView(),
                  _getTabView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getTabView() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SectionTitle("پیشنهاد سردبیر"),
        ),
        SliverToBoxAdapter(
          child: _getNewsList(),
        ),
        SliverPadding(
          padding: EdgeInsets.only(bottom: 14),
          sliver: SliverToBoxAdapter(
            child: SectionTitle("جدید‌ترین اخبار تکنولوژی"),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return NewsHorizontalWidget(tech_news[index]);
            },
            childCount: tech_news.length,
          ),
        ),
      ],
    );
  }

  Widget _getNewsList() {
    return Container(
      height: 352,
      child: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: hot_news.length,
          itemBuilder: (context, index) {
            return NewsWidget(hot_news[index]);
          },
        ),
      ),
    );
  }

  Widget _getTabBar(BuildContext context) {
    return Container(
      height: 42,
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: TabBar(
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: primaryColor,
        ),
        labelStyle: TextStyle(
          fontFamily: "Shabnam",
          fontSize: 16,
        ),
        unselectedLabelColor: greyColor,
        tabs: [
          Tab(
            text: "پیشنهادی",
          ),
          Tab(
            text: "دنبال میکنید",
          ),
        ],
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      backgroundColor: whiteColor,
      elevation: 0,
      leading: Image(
        image: Svg(
          "images/notification-status.svg",
          size: Size(24, 24),
        ),
      ),
      title: Image(
        image: Svg(
          "images/logo.svg",
          size: Size(70, 34),
        ),
      ),
      centerTitle: true,
    );
  }
}
