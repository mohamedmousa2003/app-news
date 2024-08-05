import 'package:flutter/material.dart';
import 'package:flutter_application_1/share/constatan.dart';
import 'package:flutter_application_1/share/cores/colors.dart';

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

    static List<MyCategory> categories = [
      MyCategory(
        id: sport.toLowerCase(),
        color: red,
        title: sport,
        image: "assets/images/sports.png",
      ),
      MyCategory(
        id: general.toLowerCase(),
        color: blueDark,
        title: general,
        image: "assets/images/Politics.png",
      ),
      MyCategory(
        id: health.toLowerCase(),
        color: pink,
        title: health,
        image: "assets/images/health.png",
      ),
      MyCategory(
        id: business.toLowerCase(),
        color: yellowDark,
        title: business,
        image: "assets/images/business.png",
      ),
      MyCategory(
        id: entertainment.toLowerCase(),
        color: blue,
        title: entertainment,
        image: "assets/images/environment.png",
      ),
      MyCategory(
        id: science.toLowerCase(),
        color: yellow,
        title: science,
        image: "assets/images/science.png",
      ),
    ];
}