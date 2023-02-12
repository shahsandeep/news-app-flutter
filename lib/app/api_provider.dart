import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_figma/app/shared_prefrence_helper.dart';
import 'package:news_app_figma/models/news_model.dart';

class ApiProvider {
  Future<NewsModel> newsApi() async {
    String country = SharedPrefrenceHelper.getCountry();
    String category = SharedPrefrenceHelper.getCategory();
    if (country.isEmpty && category.isEmpty) {
      country = 'IN';
      category = 'Business';
    }

    String newsUrl =
        'https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=99c9526959e0469cac44dbf7c91b764a';
    final response = await http.get(
      Uri.parse(newsUrl),
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      // print(data);
      return NewsModel.fromJson(data);
    }
    return NewsModel.error('Failed');
  }

  Future<NewsModel> searchNews(String query) async {
    final String newsUrl =
        'https://newsapi.org/v2/everything?q=$query&pageSize=10&from=present&sortBy=publishedAt&apiKey=99c9526959e0469cac44dbf7c91b764a';
    final response = await http.get(Uri.parse(newsUrl));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return NewsModel.fromJson(data);
    } else {
      return NewsModel.error(data['code'].toString());
    }
  }
}
