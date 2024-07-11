import 'package:flutter/material.dart';
import 'package:flutter_application_1/share/constatan.dart';
import 'package:flutter_application_1/pages/home/home_screen.dart';
import 'package:flutter_application_1/share/cores/colors.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key ,required this.onTap});
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    var theme =Theme.of(context);
    return Drawer(
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              color: primary,
              child: const Center(child: Text("$newsApp!")),
            ),
            ListTile(
              title: Text(
                categorie,
                style: theme.textTheme.bodyLarge,
              ),
              leading: Image.asset("assets/images/icon-list.png"),
              onTap: onTap,
            ),
          ],
        ),
      );
  }
}