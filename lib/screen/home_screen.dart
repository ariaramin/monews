import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marquee/marquee.dart';
import 'package:monews/widgets/agency_widget.dart';
import 'package:monews/widgets/section_title.dart';

import '../constants/constants.dart';
import '../repository.dart';
import '../widgets/news_horizontal_widget.dart';
import '../widgets/news_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: _getAppBar(),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      _getSliverAppBar(),
                    ];
                  },
                  body: CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: EdgeInsets.only(
                          top: 10,
                          bottom: 16,
                        ),
                        sliver: SliverToBoxAdapter(
                          child: _getCategoryList(),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SectionTitle("خبر های داغ"),
                      ),
                      SliverToBoxAdapter(
                        child: _getNewsList(),
                      ),
                      SliverToBoxAdapter(
                        child: SectionTitle("خبرگزاری ها"),
                      ),
                      SliverToBoxAdapter(
                        child: _getAgencyList(),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.only(bottom: 12),
                        sliver: SliverToBoxAdapter(
                          child: SectionTitle("خبر هایی که علاقه دارید"),
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
                      SliverPadding(
                        padding: EdgeInsets.only(bottom: 28),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 34,
                color: primaryColor,
                child: Marquee(
                  text: subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: whiteColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
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

  Widget _getAgencyList() {
    return Container(
      height: 212,
      child: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: agencies.length,
          itemBuilder: (context, index) {
            return AgencyWidget(agencies[index]);
          },
        ),
      ),
    );
  }

  Widget _getCategoryList() {
    return Container(
      height: 36,
      child: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return _getCategoryItem(index);
          },
        ),
      ),
    );
  }

  Widget _getCategoryItem(int index) {
    List<String> itemList = ["همه", "جهان", "ورزش", "تکنولوژی", "علم و دانش"];
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        margin: EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: index == _selectedCategory ? primaryLightColor : null,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Text(
          itemList[index],
          style: TextStyle(
            fontSize: 14,
            color: index == _selectedCategory ? primaryColor : greyColor,
          ),
        ),
      ),
    );
  }

  Widget _getSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 204,
      backgroundColor: whiteColor,
      flexibleSpace: FlexibleSpaceBar(
        background: _getSlider(),
      ),
    );
  }

  Widget _getSlider() {
    return CarouselSlider.builder(
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      itemCount: 2,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return Padding(
          padding: EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              "images/banner$itemIndex.png",
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      backgroundColor: whiteColor,
      elevation: 0,
      leadingWidth: 82,
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Iconsax.search_normal_1,
            color: blackColor,
          ),
          Icon(
            Iconsax.filter_edit,
            color: blackColor,
          ),
        ],
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
