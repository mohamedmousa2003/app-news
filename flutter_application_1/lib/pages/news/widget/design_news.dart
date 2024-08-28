import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/details/new_details_screen.dart';
import 'package:flutter_application_1/pages/splash/splash_screen.dart';
import 'package:flutter_application_1/share/components/custom_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../models/NewsResponse.dart';
import '../../../share/cores/colors.dart';

class DesignNews extends StatelessWidget {
  DesignNews({super.key, required this.news});
  News news;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, NewsDetailsScreen.routeName ,arguments:  news);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              /// as to error in image
              child: CachedNetworkImage(
                width: double.infinity,
                fit: BoxFit.fill,
                imageUrl: news.urlToImage ?? "",
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: primary,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            8.height,
            Text(
                maxLines: 2,
                news.author ?? "",
                style: theme.textTheme.titleSmall?.copyWith(
                  color: black.withOpacity(0.7),
                )),
            8.height,
            Text(
                maxLines: 2,
                news.title ?? "",
                style: theme.textTheme.titleSmall?.copyWith(
                  color: black,
                )),
            8.height,
            Text(
                textAlign: TextAlign.end,
                news.publishedAt ?? "",
                style: theme.textTheme.titleSmall?.copyWith(
                  color: black.withOpacity(0.7),
                ))
          ],
        ),
      ),
    );
  }
}
