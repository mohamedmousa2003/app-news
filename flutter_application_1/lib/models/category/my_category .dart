import 'package:flutter/material.dart';
import 'package:flutter_application_1/constans/constatan.dart';
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
        id: politics.toLowerCase(),
        color: blueDark,
        title: politics,
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
        id: enviroment.toLowerCase(),
        color: blue,
        title: enviroment,
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