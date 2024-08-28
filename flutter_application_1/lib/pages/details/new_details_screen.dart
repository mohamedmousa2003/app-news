import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_application_1/share/components/custom_extension.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/NewsResponse.dart';
import '../../share/cores/colors.dart';

class NewsDetailsScreen extends StatelessWidget {
  static String routeName = "details";

  get primary => null;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as News;
    var theme = Theme.of(context);
    var local =S.of(context);
    return Container(
      decoration: const BoxDecoration(
          color: white,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/background.png",
              ))),
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
            
                  /// as to error in image
                  child: CachedNetworkImage(
                    width: double.infinity,
                    fit: BoxFit.fill,
                    imageUrl: args.urlToImage ?? "",
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff39A552),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                8.height,
                Text(
                    maxLines: 2,
                    args.author ?? "",
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: black.withOpacity(0.7),
                    )),
                8.height,
                Text(
                    
                    args.title ?? "",
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: black,
                    )),
                8.height,
                Text(
                    textAlign: TextAlign.end,
                    args.publishedAt ?? "",
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: black.withOpacity(0.7),
                    )),
                15.height,
                Text(args.description ?? "",
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: black.withOpacity(0.7),
                    )),
              15.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      iconAlignment: IconAlignment.end,
                      onPressed: (){
                        open(args.url);
                      },
                      label: Icon(Icons.play_arrow ,color: primary,),
                      icon: Text(local.viewArticle,style:  theme.textTheme.bodySmall ),
                     ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void open(String? url) async{
    if(url == null){
      return ;
    }
    var uri = Uri.parse(url);
    if(await canLaunchUrl(uri)){
     launchUrl(uri); 
    }
}

}

