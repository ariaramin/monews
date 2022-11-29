import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../constants/constants.dart';
import '../screen/news_screen.dart';

class NewsHorizontalWidget extends StatelessWidget {
  const NewsHorizontalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NewsScreen(),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          // width: 380,
          // height: 338,
          padding: EdgeInsets.all(4),
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: greyColor.withOpacity(.4),
                offset: Offset(4, 4),
                blurRadius: 20,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 116,
                      // height: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image(
                          image: AssetImage("images/news_image2.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 6,
                      right: 6,
                      child: Container(
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(.5),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        child: Text(
                          "تکنولوژی",
                          style: TextStyle(
                            fontSize: 10,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
                    children: [
                      Text(
                        "سـاعـت هوشـمـنـد گــارمـیـن Venu Sq 2 بـاعمر باتری ۱۱ روزه معرفی شد",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "گارمین در رویداد IFA ۲۰۲۲ ساعت هوشمند Venu Sq 2 و ردیاب سلامت کودکان موسوم به Black Panther Vivofit Jr 3 را معرفی کرد.",
                        style: TextStyle(
                          fontSize: 10,
                          color: greyColor,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image(
                                image: AssetImage("images/agency2.png"),
                                width: 20,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "خبرگزاری زومیت",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Iconsax.more,
                            color: greyColor,
                            size: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
