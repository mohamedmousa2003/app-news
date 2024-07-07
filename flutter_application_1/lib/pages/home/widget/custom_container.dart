import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/category/my_category%20.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  CustomContainer({
    super.key ,
    required this.myCategory ,
    required this.index,
    required this.onTap,
  });
  final MyCategory myCategory ;
  final Function onTap;
  int index;
  @override
  Widget build(BuildContext context) {
    var theme =Theme.of(context);
    return InkWell(
      onTap: (){
        onTap(myCategory);
      },
      child: Container(
        decoration:  BoxDecoration(
            color: myCategory.color,
            borderRadius:index.isEven ? const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
            ) : const BorderRadius.only(
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(myCategory.image ?? "",),
            Text(myCategory.title ?? "",style: theme.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
