import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:pub_api_search/main.mix.dart';

class HomeMix {
  static Mix flexbox = Mix(
    width(double.infinity),
    mainAxis(MainAxisAlignment.center),
    crossAxis(CrossAxisAlignment.center),
  );

  static Mix resultsBox = Mix(
    borderColor(MainMix.primary),
    borderWidth(1),
    rounded(15),
  );

  static Mix resultItem = Mix(
    width(double.infinity),
    bgColor(Colors.transparent),
    textColor(MainMix.primary),
    pi(const EdgeInsets.symmetric(horizontal: 34, vertical: 10)),
    rounded(0),
  );

  static Mix resultItemTop = Mix(
    onPress(
      bgColor(MainMix.primary),
      textColor(Colors.black),
      fontWeight(FontWeight.w700),
      border(asBorder: Border.all(color: MainMix.primary, width: 1)),
      roundedTL(15),
      roundedTR(15),
      pi(const EdgeInsets.symmetric(horizontal: 34, vertical: 9)),
    ),
  );

  static Mix resultItemBody = Mix(
    onPress(
      bgColor(MainMix.primary),
      fontWeight(FontWeight.w700),
      textColor(Colors.black),
      border(asBorder: Border.all(color: MainMix.primary, width: 1)),
      pi(const EdgeInsets.symmetric(horizontal: 34, vertical: 9)),
    ),
  );

  static Mix resultItemBottom = Mix(
    onPress(
      bgColor(MainMix.primary),
      textColor(Colors.black),
      fontWeight(FontWeight.w700),
      border(asBorder: Border.all(color: MainMix.primary, width: 1)),
      roundedBL(15),
      roundedBR(15),
      pi(const EdgeInsets.symmetric(horizontal: 34, vertical: 9)),
    ),
  );

  static Mix box = Mix(
    borderColor(MainMix.primary),
    borderWidth(2),
    rounded(44),
  );

  static Mix text = Mix(
    textColor(MainMix.primary),
    fontWeight(FontWeight.w400),
    fontSize(14),
  );

  static Mix icon = Mix(
    iconColor(MainMix.primary),
  );

  static Mix textField = Mix(
    width(200),
  );
}
