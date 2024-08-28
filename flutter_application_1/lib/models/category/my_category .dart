import 'package:flutter/material.dart';
import 'package:flutter_application_1/share/constatan.dart';
import 'package:flutter_application_1/share/cores/colors.dart';

import '../../generated/l10n.dart';

class MyCategory {
  String ? id;
  String ? title ;
  String ? image ;
  Color ? color ;

  MyCategory({
    required this.color,
    required this.title,
    this.id ,
    required this.image,
    });

    static List<MyCategory> getCategories(BuildContext context) {
    return [
      MyCategory(
        id: sport.toLowerCase(),
        color: red,
        title: S.of(context).sport,
        image: "assets/images/sports.png",
      ),
      MyCategory(
        id: general.toLowerCase(),
        color: blueDark,
        title: S.of(context).general,
        image: "assets/images/Politics.png",
      ),
      MyCategory(
        id: health.toLowerCase(),
        color: pink,
        title: S.of(context).health,
        image: "assets/images/health.png",
      ),
      MyCategory(
        id: business.toLowerCase(),
        color: yellowDark,
        title: S.of(context).business,
        image: "assets/images/business.png",
      ),
      MyCategory(
        id: entertainment.toLowerCase(),
        color: blue,
        title: S.of(context).entertainment,
        image: "assets/images/environment.png",
      ),
      MyCategory(
        id: science.toLowerCase(),
        color: yellow,
        title: S.of(context).science,
        image: "assets/images/science.png",
      ),
    ];
  }
}


/*
business entertainment general health science sports technology
*/