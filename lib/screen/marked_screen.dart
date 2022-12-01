import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:hive/hive.dart';
import 'package:monews/constants/constants.dart';
import 'package:monews/widgets/news_horizontal_widget.dart';

import '../models/news.dart';

class MarkedScreen extends StatefulWidget {
  const MarkedScreen({super.key});

  @override
  State<MarkedScreen> createState() => _MarkedScreenState();
}

class _MarkedScreenState extends State<MarkedScreen> {
  List<News> _marked_news = [];

  @override
  void initState() {
    super.initState();
    _getMarkedNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: _getAppBar(),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "خبرهایی که مارک شده‌اند",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _getNewsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getNewsList() {
    return ListView.builder(
      itemCount: _marked_news.length,
      itemBuilder: (context, index) {
        return NewsHorizontalWidget(_marked_news[index]);
      },
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      backgroundColor: whiteColor,
      elevation: 0,
      title: Image(
        image: Svg(
          "images/logo.svg",
          size: Size(70, 34),
        ),
      ),
      centerTitle: true,
    );
  }

  void _getMarkedNews() {
    var marked_news = Hive.box<News>("marked_news");
    setState(() {
      _marked_news = marked_news.values.toList();
    });
  }
}
