import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/source_model/source_model.dart';
import 'package:flutter_application_1/share/cores/colors.dart';

// ignore: must_be_immutable
class TabItem extends StatelessWidget {
  TabItem({super.key ,required this.isSelected,required this.sourceData});
  bool isSelected = true;
  Source sourceData;
  @override
  Widget build(BuildContext context) {
    var theme =Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: 15),
       padding: EdgeInsets.symmetric(vertical: 8 ,horizontal: 15),
      decoration: BoxDecoration(
        color: isSelected ? primary : transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: primary,
          width: 3,
        )
      ),
      child: Text(sourceData.name ?? "", 
      style: isSelected ? 
       theme.textTheme.titleSmall
       :theme.textTheme.titleSmall ?.copyWith(color: primary)
      ),
    );
  }
}