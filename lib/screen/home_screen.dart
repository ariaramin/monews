import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:monews/constants/constants.dart';
import 'package:monews/widgets/news_horizontal_widget.dart';
import 'package:monews/widgets/news_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          child: _getTitle("خبر های داغ"),
        ),
        SliverToBoxAdapter(
          child: _getNewsList(),
        ),
        SliverPadding(
          padding: EdgeInsets.only(bottom: 14),
          sliver: SliverToBoxAdapter(
            child: _getTitle("خبر هایی که علاقه دارید"),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return NewsHorizontalWidget();
            },
            childCount: 4,
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
          itemCount: 8,
          itemBuilder: (context, index) {
            return NewsWidget();
          },
        ),
      ),
    );
  }

  Widget _getTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "مشاهده بیشتر",
            style: TextStyle(
              fontSize: 12,
              color: primaryColor,
            ),
          ),
        ],
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
