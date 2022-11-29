import "package:flutter/material.dart";

import '../constants/constants.dart';

class AgencyWidget extends StatelessWidget {
  String _imageSource, _title;

  AgencyWidget(this._imageSource, this._title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 26,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              _imageSource,
              fit: BoxFit.cover,
              width: 56,
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              _title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 14,
              ),
              decoration: BoxDecoration(
                color: primaryLightColor,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Text(
                "دنبال کردن",
                style: TextStyle(
                  fontSize: 14,
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
