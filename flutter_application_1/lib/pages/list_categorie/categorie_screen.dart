import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/category/my_category%20.dart';
import 'package:flutter_application_1/models/source_model/source_model.dart';
import 'package:flutter_application_1/pages/list_categorie/widget/tab_container.dart';
import 'package:flutter_application_1/share/cores/colors.dart';
import 'package:flutter_application_1/share/cores/newtwork_layer/api_manager.dart';

class CategoricScreen extends StatefulWidget {
  const CategoricScreen({super.key , required this.myCategory});
  final MyCategory myCategory;

  @override
  State<CategoricScreen> createState() => _CategoricScreenState();
}

class _CategoricScreenState extends State<CategoricScreen> {
   /*
   late Future<SourceModel> fetchSources;

   @override
  void initState() {
    super.initState();
    fetchSources = ApiManager.fetchSource(widget.myCategory.id ?? "");
  }
    */
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    //var args = ModalRoute.of(context)?.settings.arguments as CategorieTitle;
    return FutureBuilder<SourceModel>(
      //future: ApiManager.fetchSource(widget.myCategory.id ?? ""), 
      future: ApiManager.fetchSource(widget.myCategory.id ?? ""),
      builder: (context, snapshot) {
        if(snapshot.hasError) {
          return Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(snapshot.data?.message??"Something is wrong",style: theme.textTheme.bodyLarge,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8),
                  backgroundColor: primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  )
                ),
                onPressed: (){
                  ApiManager.fetchSource(widget.myCategory.id ?? "");
                  setState(() {
                  });
                },
                 child: Text("Try Again" ,style: theme.textTheme.bodySmall,)
                 ),
            ],
          ),);
        }
        else if(snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(
            color: primary,
          ),);
        }
        /// response tow way "ok" , "error" 
        else{
          if(snapshot.data?.status != 'ok'){
          return Column(
            children: [
              Text(snapshot.data?.message ?? "Something is wrong"),
              ElevatedButton(
                onPressed: (){
                  ApiManager.fetchSource(widget.myCategory.id ?? "");
                  setState(() {
                  });
                },
                child: Text("Try Again"),)
            ],
          );
        }
        var sourcesList = snapshot.data?.sources ?? [];
        return TabContainer(sourcesList: sourcesList);
        }
        
      },
      );
  }
}
/*
ListView.builder(
          itemCount: sourcesList.length,
          itemBuilder: (context, index) {
            return Text(sourcesList[index].name ?? "error" ,style: theme.textTheme.bodyLarge,); 
          },
          
        );
*/


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