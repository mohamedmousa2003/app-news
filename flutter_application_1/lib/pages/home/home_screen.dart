import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/widget/custom_categorie.dart';
import 'package:flutter_application_1/pages/setting/setting_view.dart';
import 'package:flutter_application_1/share/constatan.dart';
import 'package:flutter_application_1/models/category/my_category%20.dart';
import 'package:flutter_application_1/pages/home/widget/custom_container.dart';
import 'package:flutter_application_1/pages/home/widget/custom_drawer.dart';
import 'package:flutter_application_1/pages/list_categorie/categorie_screen.dart';
import 'package:flutter_application_1/share/cores/colors.dart';

import '../../generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key,});

  static String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var local=S.of(context);
    List<MyCategory> categories = MyCategory.getCategories(context);
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
      child: Scaffold(
        backgroundColor: transparent,
        drawer: CustomDrawer(
          onTap: onDrawerClick,
        ),
        appBar: AppBar(
          title: Text(
            selectedDrawerItem ==CustomDrawer.settingNumber? local.setting :selectedCategorie == null ? local.title : selectedCategorie?.title ?? "", style: theme.textTheme.bodyMedium,),
        ),
        body: selectedDrawerItem ==CustomDrawer.settingNumber? SettingView():
        selectedCategorie ==null?
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(local.titleHome ,style: theme.textTheme.bodyMedium?.copyWith(color:const Color(0xff4F5A69),),),
      
               Expanded(
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index){
                       final categorie = categories[index];
                       return CustomCategorie(
                         myCategory:categorie ,
                         onTap: onCategorieIteam,
                         );
                    }
                ),
              ),
      
            ],
          ),
        )
        :  CategoricScreen(myCategory: selectedCategorie!,),
      ),
    );
  }
  MyCategory? selectedCategorie;

  onCategorieIteam(MyCategory categorie){
    selectedCategorie = categorie;
    setState(() {});
  }
   int selectedDrawerItem = CustomDrawer.categoric;
  onDrawerClick(int newSelectedDrawerItem){
    selectedDrawerItem =newSelectedDrawerItem ;
    selectedCategorie= null ;
    Navigator.pop(context);
    setState(() {
      
    });
  }
}

/*
onDrawerClick(){
    selectedCategorie =null;
    Navigator.pop(context);
    setState(() {});
  }
*/



/*

Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: MyCategory.categories.length,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: MediaQuery.of(context).size.width*1/ MediaQuery.of(context).size.height*1.6,//  width / height
                  ),
                itemBuilder: (context, index){
                   final categories = MyCategory.categories[index];
                   return CustomContainer(
                     myCategory:categories ,
                     onTap: onCategorieIteam,
                     index: index,
                     );
                }
              ),
            ),

           
*/