import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/widget/custom_categorie.dart';
import 'package:flutter_application_1/share/components/custom_extension.dart';
import 'package:flutter_application_1/share/constatan.dart';
import 'package:flutter_application_1/pages/home/home_screen.dart';
import 'package:flutter_application_1/share/cores/colors.dart';

import '../../../generated/l10n.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key ,required this.onTap});
  Function onTap;
  static int categoric = 1;
  static int settingNumber= 2;

  @override
  Widget build(BuildContext context) {
    var theme =Theme.of(context);
    var local =S.of(context);
    return Container(
      decoration: const BoxDecoration(
        color: white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/images/background.png",
            
          )
        )
      ),
      child: Drawer(
        backgroundColor: transparent,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                color: primary,
                child:  Center(child: Text("${local.title}!")),
              ),
              ListTile(
                title: Text(
                  local.categorie,
                  style: theme.textTheme.bodyLarge,
                ),
                leading: Image.asset("assets/images/icon-list.png"),
                onTap: (){
                  onTap(CustomDrawer.categoric);
                },
              ),
              15.height,
              ListTile(
                title: Text(
                  local.setting,
                  style: theme.textTheme.bodyLarge,
                ),
                leading: Image.asset("assets/images/icon-settings.png"),
                onTap: (){
                  onTap(CustomDrawer.settingNumber);
                },
              ),
            ],
          ),
        ),
    );
  }
}