import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:monews/models/news.dart';
import 'package:monews/screen/news_screen.dart';
import '../constants/constants.dart';

class NewsWidget extends StatelessWidget {
  News news;
  NewsWidget(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NewsScreen(news),
            ),
          );
        },
        child: Container(
          width: 292,
          // height: 338,
          padding: EdgeInsets.all(4),
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 22),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: greyColor.withOpacity(.4),
                offset: Offset(2, 4),
                blurRadius: 20,
              ),
            ],
          ),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Container(
                    width: double.infinity,
                    height: 182,
                    padding: EdgeInsets.only(bottom: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image(
                        image: AssetImage("images/${news.image_url}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(.5),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        news.category,
                        style: TextStyle(
                          fontSize: 12,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Iconsax.flash_circle5,
                              color: primaryColor,
                              size: 18,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "پیشنهاد مونیوز",
                              style: TextStyle(
                                fontSize: 12,
                                color: greyColor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          news.date!,
                          style: TextStyle(
                            fontSize: 12,
                            color: greyColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      news.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image(
                              image:
                                  AssetImage("images/${news.agency.image_url}"),
                              width: 20,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "${news.agency.name} خبرگزاری",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          "assets/icons/menu2.svg",
                          color: greyColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
