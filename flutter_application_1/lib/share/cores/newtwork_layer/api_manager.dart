///  function call network request api
/// Make a network request
/// The http.get() method returns a Future that contains a Response.
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/NewsResponse.dart';
import 'package:flutter_application_1/models/source_model/source_model.dart';
import 'package:flutter_application_1/share/constatan.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static Future<SourceModel> fetchSource(String categoryId) async {
    Map<String, dynamic> queryParameters = {
      "apiKey": apiKey,
      "category": categoryId
    };
    Uri uri = Uri.https(
      domain, // domain
      "/v2/top-headlines/sources", // endpoint
      queryParameters,
    );
    final response =
        await http.get(uri); // http هنا بنادي علي  <= ده معني package
    // body موجود في response بتاع return
    debugPrint(response.body);
    var sourceData=SourceModel.fromJson(jsonDecode(response.body));
    // handel status Code
    if(response.statusCode == 200 && jsonDecode(response.body)['status'] == "ok") {
      return sourceData;
    }
    else {
       throw Exception('Failed to load sources');
    }
   }

  
  static Future<NewsResponse> fetchNews(String sourceId) async {
    // https://newsapi.org/v2/everything?q=bitcoin&apiKey=c0ea92d2782644d0b85fa5e003756620
    Map<String, dynamic> queryParameters = {
      "apiKey": apiKey,
      "sources": sourceId
    };
    Uri uri = Uri.https(
      domain, // domain
      "/v2/everything", // endpoint
      queryParameters,
    );
    final response =
        await http.get(uri); // http هنا بنادي علي  <= ده معني package
    // body موجود في response بتاع return
    debugPrint(response.body);
    var newsData=NewsResponse.fromJson(jsonDecode(response.body));
    // handel status Code
    if(response.statusCode == 200 && jsonDecode(response.body)['status'] == "ok") {
      return newsData;
    }
    else {
      throw Exception('Failed to load sources');
    }
  }

}


/*
 var bodyString = response.body; // body => type of String
    // how to convert string to json
    var json = jsonDecode(bodyString);
    return SourceModel.fromJson(json); // بتتخرن in sanpshot
  
*/