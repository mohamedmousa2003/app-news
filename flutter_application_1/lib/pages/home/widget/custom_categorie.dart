import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/category/my_category%20.dart';
import 'package:flutter_application_1/pages/news/widget/design_news.dart';
import 'package:flutter_application_1/share/components/custom_extension.dart';
import 'package:flutter_application_1/share/cores/colors.dart';

class CustomCategorie extends StatelessWidget {
  const CustomCategorie({super.key,required this.myCategory,required this.onTap});
final MyCategory myCategory ;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    var theme =Theme.of(context);
    return InkWell(
      onTap: (){
        onTap(myCategory);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: myCategory.color,
        ),
        child: Row(
          children: [
             SizedBox(
              width: 140,
              child: Image.asset(myCategory.image ?? "",)),
             15.width,
            Text(myCategory.title ?? "",style: theme.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}