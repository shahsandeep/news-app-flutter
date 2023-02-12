import 'package:news_app_figma/app/api_provider.dart';
import 'package:news_app_figma/app/shared_prefrence_helper.dart';
import 'package:news_app_figma/models/news_model.dart';
import 'package:rxdart/rxdart.dart';

class NewsBloc {
  final ApiProvider _apiProvider = ApiProvider();
  final BehaviorSubject<NewsModel> _responseGetNews =
      BehaviorSubject<NewsModel>();

  final BehaviorSubject<NewsModel> _responseSearchNews =
      BehaviorSubject<NewsModel>();

  final BehaviorSubject<List<String>> _countries =
      BehaviorSubject<List<String>>();

  final BehaviorSubject<List<String>> _category =
      BehaviorSubject<List<String>>();

  String country = 'IN';
  String category = 'Business';

  Future<NewsModel> getNewsApi() async {
    final response = await _apiProvider.newsApi();
    _responseGetNews.sink.add(response);
    return response;
  }

  Future<NewsModel> getSearchApi(String query) async {
    final response = await _apiProvider.searchNews(query);
    _responseSearchNews.sink.add(response);
    return response;
  }

  Future<List<String>> getCountry() async {
    List<String> listData = [
      'IN',
      'US',
    ];

    if (SharedPrefrenceHelper.getCountry().isEmpty) {
      country = listData.first;
      SharedPrefrenceHelper.setCountry(country);
    } else {
      country = SharedPrefrenceHelper.getCountry();
    }
    _countries.sink.add(listData);

    return listData;
  }

  Future<List<String>> getCategory() async {
    List<String> categoryList = [
      'Business',
      'Entertainment',
      'Technology',
      'Health',
      'Sports',
      'General',
      'Science',
    ];

    if (SharedPrefrenceHelper.getCategory().isEmpty) {
      category = categoryList.first;
      SharedPrefrenceHelper.setCategory(category);
    } else {
      category = SharedPrefrenceHelper.getCategory();
    }

    _category.sink.add(categoryList);
    return categoryList;
  }

  setCountry(String country) {
    SharedPrefrenceHelper.setCountry(country);
    getCountry();
    getCategory();

    getNewsApi();
  }

  setCategory(String category) {
    SharedPrefrenceHelper.setCategory(category);
    getCountry();
    getCategory();

    getNewsApi();
  }

  BehaviorSubject<NewsModel> get responseGetNews => _responseGetNews;
  BehaviorSubject<NewsModel> get responseSearchNews => _responseSearchNews;
  BehaviorSubject<List<String>> get countries => _countries;
  BehaviorSubject<List<String>> get categories => _category;
}

NewsBloc newsBloc = NewsBloc();
