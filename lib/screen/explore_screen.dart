import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marquee/marquee.dart';
import 'package:monews/widgets/agency_widget.dart';

import '../constants/constants.dart';
import '../widgets/news_widget.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
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
                      SliverAppBar(
                        expandedHeight: 192,
                        backgroundColor: whiteColor,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Padding(
                            padding: EdgeInsets.all(8),
                            child: Image.asset(
                              "images/banner1.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
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
                        child: _getTitle("خبرگزاری ها"),
                      ),
                      SliverToBoxAdapter(
                        child: _getAgencyList(),
                      ),
                      SliverToBoxAdapter(
                        child: _getTitle("پیشنهاد سردبیر"),
                      ),
                      SliverToBoxAdapter(
                        child: _getNewsList(),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 34,
                color: primaryColor,
                child: Marquee(
                  text:
                      "برانکو تکذیب کرد/ نه با عمان فسخ کردم، نه با ایران مذاکره داشتم   ...   ",
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
          itemCount: 8,
          itemBuilder: (context, index) {
            return NewsWidget();
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
          itemCount: 3,
          itemBuilder: (context, index) {
            return AgencyWidget(
              "images/agency.png",
              "ورزش سه",
            );
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