import 'package:flutter/material.dart';
import 'package:news_app_figma/bloc/news_bloc.dart';
import 'package:news_app_figma/constants/colors.dart';
import 'package:news_app_figma/constants/routes.dart';
import 'package:news_app_figma/screens/home_page.dart';
import 'package:news_app_figma/screens/webview_news_details.dart';
import 'package:news_app_figma/widgets/catagory_button.dart';
import 'package:news_app_figma/widgets/list_container.dart';

import 'package:news_app_figma/widgets/search_box.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController search = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    search.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(homePageRoute, (route) => false);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: AppColor().primary,
          title: const Text('Search News'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10,
            bottom: 10,
          ),
          child: Column(
            children: [
              // Searchbox resuable widgets

              SearchBox(
                controller: search,
                isButton: true,
                icon: Icons.search_sharp,
                iconButton: IconButton(
                  onPressed: () {
                    // newsBloc.getSearchApi(search.text);

                    if (search.text == '') {
                      const snackBar = SnackBar(
                        content: Text('Please Enter Something'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      newsBloc.getSearchApi(search.text);
                    }
                    // search.clear();
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 40.0,
                width: double.maxFinite,

                // Category Button Resuable Widget

                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: HomePage.categoryList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CategoryButton(
                            color: AppColor().primary,
                            text: HomePage.categoryList[index],
                            height: 40.0,
                            width: HomePage.categoryList[index].length < 7
                                ? 80
                                : 120),
                      );
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
// List Container Reusable Widget.
              StreamBuilder(
                stream: newsBloc.responseSearchNews.stream,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data?.error == null) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data?.articles?.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            WebViewNewsDetails(
                                                article: snapshot
                                                    .data?.articles![index]),
                                      ));
                                },
                                child: ListContainer(
                                  image: snapshot
                                      .data?.articles![index].urlToImage,
                                  headline:
                                      snapshot.data?.articles![index].title ??
                                          'This is Headline',
                                  author:
                                      snapshot.data?.articles![index].author ??
                                          'Sandeep',
                                  dateAndTime: snapshot
                                          .data?.articles![index].publishedAt
                                          .toString()
                                          .replaceRange(16, null, '') ??
                                      '14/01/2023',
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Center(
                          child: Text(snapshot.data?.error.toString() ?? ''));
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
