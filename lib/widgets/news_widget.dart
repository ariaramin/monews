import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:monews/screen/news_screen.dart';
import '../constants/constants.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

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
                        image: AssetImage("images/news_image.png"),
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
                        "ورزشی",
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
                          "۵ دقیقه پیش",
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
                      "پــاسـخ منـفـی پــورتـــو بـه چلـسـی بـرای جذب طارمی با طعم تهدید!",
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
                              image: AssetImage("images/agency.png"),
                              width: 20,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "خبرگزاری ورزش سه",
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
                    SizedBox(
                      height: 4,
                    )
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
