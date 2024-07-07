import 'package:flutter/material.dart';
import 'package:flutter_application_1/constans/constatan.dart';
import 'package:flutter_application_1/models/category/my_category%20.dart';
import 'package:flutter_application_1/pages/home/widget/custom_container.dart';
import 'package:flutter_application_1/pages/home/widget/custom_drawer.dart';
import 'package:flutter_application_1/pages/list_categorie/categorie_screen.dart';

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
    return Scaffold(
      drawer: CustomDrawer(
        onTap: onDrawerClick,
      ),
      appBar: AppBar(
        title: Text(
          selectedCategorie == null ? "newsApp" : selectedCategorie?.title ?? "", style: theme.textTheme.bodyMedium,),
      ),
      body: selectedCategorie ==null? 
      Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titleHome ,style: theme.textTheme.bodyMedium?.copyWith(color:const Color(0xff4F5A69),),),
            
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: MyCategory.categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 9/11,//  width / height
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
            )
          ],
        ),
      )
      : const CategorieScreen(),
    );
  }

  MyCategory? selectedCategorie;

  onCategorieIteam(MyCategory categorie){
    selectedCategorie = categorie;
    setState(() {
      
    });
  }

  onDrawerClick(){
    selectedCategorie =null;
    Navigator.pop(context);
    setState(() {
      
    });
  }
}

