import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app_figma/bloc/news_bloc.dart';

import 'package:news_app_figma/constants/colors.dart';
import 'package:news_app_figma/constants/fonts.dart';
import 'package:news_app_figma/constants/routes.dart';
import 'package:news_app_figma/models/news_model.dart';

import 'package:news_app_figma/screens/webview_news_details.dart';
import 'package:news_app_figma/widgets/caraousel_container.dart';
import 'package:news_app_figma/widgets/catagory_button.dart';
import 'package:news_app_figma/widgets/list_container.dart';
import 'package:news_app_figma/widgets/search_box.dart';

import '../widgets/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  ];

  static List<String> categoryList = [
    'Business',
    'Entertainment',
    'Technology',
    'Health',
    'Sports',
    'General',
    'Science',
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Map<int, bool> itemsSelectedValue = Map();
  String country = 'IN';
  String category = 'Business';
  // List<String> listData = ["en", 'in'];

  @override
  void initState() {
    super.initState();
    newsBloc.getCountry();
    newsBloc.getCategory();
    newsBloc.getNewsApi();
    newsBloc.setCountry(country);
    newsBloc.setCategory(category);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<NewsModel>(
              stream: newsBloc.responseGetNews.stream,
              builder: (context, snapshot) {
                // List<Article> crouselData = snapshot.data?.articles ?? [];
                if (snapshot.hasData) {
                  return Stack(
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),

                          // Search bar and Notification Icon

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: 40,
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: InkWell(
                                        onTap: () => Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                                searchPageRoute,
                                                (route) => false),
                                        child: const SearchBox(
                                          isEnable: false,
                                          icon: Icons.search,
                                        ),
                                      ),
                                    ),

                                    // const SizedBox(
                                    //   width: 10,
                                    // ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 45,
                                width: 50,
                                decoration: const BoxDecoration(
                                  // color: AppColor().primary,
                                  shape: BoxShape.circle,
                                ),
                                child: StreamBuilder<List<String>>(
                                    stream: newsBloc.countries.stream,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        country = newsBloc.country;
                                        List<String> data = snapshot.data ?? [];
                                        return DropdownButton<String>(
                                            value: country,
                                            items: data
                                                .map<DropdownMenuItem<String>>(
                                                    (e) => DropdownMenuItem(
                                                        value: e,
                                                        child: Text(e)))
                                                .toList(),
                                            onChanged: (value) {
                                              newsBloc
                                                  .setCountry(value ?? "IN");
                                            });
                                      }
                                      return Container();
                                    }),
                              )
                            ],
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          // Latest news and see all
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Latest News',
                                        style: TextStyle(
                                          fontFamily: AppFont().neYork,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'See all',
                                            style: TextStyle(
                                              fontFamily: AppFont().nunito,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: AppColor().secondary,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            size: 20,
                                            color: AppColor().secondary,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  // Caraousel Slider With news headings etc.
                                  CarouselSlider(
                                    items: snapshot.data?.articles!
                                        .map(
                                          (e) => InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      WebViewNewsDetails(
                                                    article: e,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: CaraouselContainer(
                                              author: e.author ?? 'Sandeep',
                                              headline: e.title,
                                              body: e.description ??
                                                  'This is Body',
                                              isBorderRadius: true,
                                              image: e.urlToImage ??
                                                  HomePage.imgList[0],
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    options: CarouselOptions(
                                      autoPlay: true,
                                      enlargeCenterPage: true,
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),

                                  // Category Buttons
                                  SizedBox(
                                    height: 40,
                                    width: double.maxFinite,
                                    child: StreamBuilder(
                                        stream: newsBloc.categories.stream,
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            // category = newsBloc.category;

                                            List<String> categoryData =
                                                snapshot.data ?? [];

                                            return ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: categoryData.length,
                                              itemBuilder: ((context, index) {
                                                // color change not working now
                                                // bool? isCurrentIndexSelected =
                                                //     itemsSelectedValue[index] ==
                                                //             null
                                                //         ? false
                                                //         : itemsSelectedValue[
                                                //             index];
                                                return InkWell(
                                                  onTap: () {
                                                    newsBloc.setCategory(
                                                        categoryData[index]);
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10),
                                                    child: CategoryButton(
                                                      color: AppColor().primary,
                                                      height: 40,
                                                      width: categoryData[index]
                                                                  .length <
                                                              7
                                                          ? 80
                                                          : 120,
                                                      text: categoryData[index],
                                                    ),
                                                  ),
                                                );
                                              }),
                                            );
                                          }
                                          return Container();
                                        }),
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),

                                  // List of Containers News ..

                                  SizedBox(
                                    // height: MediaQuery.of(context).size.height * 0.4,
                                    width: double.maxFinite,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount:
                                            snapshot.data?.articles?.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () async {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      WebViewNewsDetails(
                                                    article: snapshot
                                                        .data?.articles![index],
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 10,
                                              ),
                                              child: ListContainer(
                                                image: snapshot
                                                        .data
                                                        ?.articles![index]
                                                        .urlToImage ??
                                                    HomePage.imgList[0],
                                                headline: snapshot
                                                        .data
                                                        ?.articles![index]
                                                        .title ??
                                                    'This is headline',
                                                author: snapshot
                                                        .data
                                                        ?.articles![index]
                                                        .author ??
                                                    'Sandeep',
                                                dateAndTime: snapshot
                                                        .data
                                                        ?.articles![index]
                                                        .publishedAt
                                                        .toString()
                                                        .replaceRange(
                                                            16, null, '') ??
                                                    '14/01/2023',
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      // Bottom Navigation bar calling Align for aligning it to bottom top
                      const Align(
                        alignment: Alignment(0.0, 0.9),
                        child: Padding(
                            padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            child: BottomNavigation()),
                      ),
                    ],
                  );
                } else {}
                return const Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    );
  }
}
