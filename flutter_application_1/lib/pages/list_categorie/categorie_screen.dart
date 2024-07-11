import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/category/my_category%20.dart';
import 'package:flutter_application_1/models/source_model/source_model.dart';
import 'package:flutter_application_1/share/cores/newtwork_layer/api_manager.dart';

class CategorieScreen extends StatelessWidget {
  const CategorieScreen({super.key , required this.myCategory});
  final MyCategory myCategory;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    //var args = ModalRoute.of(context)?.settings.arguments as CategorieTitle;
    return Scaffold(
    
    );
  }
  
}

/*
  body: FutureBuilder<SourceModel>(
        future: ApiManager().fetchSource(myCategory.id ?? ""),
        builder: ( context,  snapshot) {
          return ListView.builder(
          itemCount: 1,
            itemBuilder: (context, index) {
              var source = snapshot.data?.sources?[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(source?.name ?? "" ,style: theme.textTheme.bodyLarge,),
              );
            },);
        },
      ),
      */