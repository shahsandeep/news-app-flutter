import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:news_app_figma/app/shared_prefrence_call.dart';
import 'package:news_app_figma/constants/routes.dart';
import 'package:news_app_figma/screens/home_page.dart';
import 'package:news_app_figma/screens/news_detail_page.dart';
import 'package:news_app_figma/screens/search_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  await SharedPrefrenceInit.initSharePrefrence();
  runApp(
    MaterialApp(
      routes: {
        homePageRoute: (context) => const HomePage(),
        searchPageRoute: (context) => const SearchPage(),
        newsDetail: (context) => const NewsDetail(),
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    ),
  );
}
