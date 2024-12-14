import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:news_app/src/features/controller/app_controller/news_api.dart';
import 'package:news_app/src/features/model/news_head_line_model.dart';
import 'package:news_app/src/features/model/news_model.dart';

class ApiService {
  NewsModel? newsModel;
  NewsHeadLineModel? newsHeadLineModel;

  Future<NewsModel?> fetchData() async {
    try {
      var url = Uri.parse(NewsApi.baseurl);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
       
        newsModel = NewsModel.fromJson(jsonData);

        final url2 = Uri.parse(NewsApi.headlinebaseurl);

        final response1 = await http.get(url2);
        if (response.statusCode == 200) {
          final data = jsonDecode(response1.body);
          // print("yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy$data");

          newsModel!.newsHeadLineModel = NewsHeadLineModel.fromJson(data);

          return newsModel;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }
}







  //   var url = Uri.parse(NewsApi.baseurl);
  //   final response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     final jsonData = jsonDecode(response.body);

  //     final url2 = Uri.parse(NewsApi.headlinebaseurl);

  //     final response1 = await http.get(url2);
  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(response1.body);

  //       newsModel = NewsModel.fromJson(jsonData);

  //       newsModel!.newsHeadLineModel = NewsHeadLineModel.fromJson(data);

  //       return newsModel;
  //     }
  //   }
  //   return null;
  // }