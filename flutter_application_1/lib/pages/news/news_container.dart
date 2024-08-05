import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/NewsResponse.dart';
import 'package:flutter_application_1/models/source_model/source_model.dart';
import 'package:flutter_application_1/pages/news/widget/design_news.dart';
import 'package:flutter_application_1/share/cores/newtwork_layer/api_manager.dart';

import '../../share/cores/colors.dart';

class NewsContainer extends StatefulWidget {
  NewsContainer({super.key ,required this.source});
  Source source;
  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  /*
  late Future<NewsResponse> fetchNews;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchNews = ApiManager.fetchNews(widget.source.id ?? "");
  }
   */
  @override
  Widget build(BuildContext context) {
    var theme =Theme.of(context);
    return FutureBuilder<NewsResponse>(
        future: ApiManager.fetchNews(widget.source.id ?? ""),
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshot.data?.message ??"Something is wrong",style: theme.textTheme.bodyLarge,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(8),
                        backgroundColor: primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        )
                    ),
                    onPressed: (){
                      //fetchNews;
                      ApiManager.fetchNews(widget.source.name ?? "");
                      setState(() {});
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
          else {
            if (snapshot.data?.status != 'ok') {
              return Column(
                children: [
                  Text(snapshot.data?.message ?? "Something is wrong"),
                  ElevatedButton(
                    onPressed: () {
                      ApiManager.fetchNews(widget.source.name ?? "");
                      setState(() {});
                    },
                    child: const Text("Try Again"),)
                ],
              );
            }
          }
          List newsList= snapshot.data?.articles ?? [];
          return ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              return DesignNews(news: newsList[index],);
          },);
        },);
  }
}
