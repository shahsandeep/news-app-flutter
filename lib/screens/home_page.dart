import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:news_app_figma/constants/colors.dart';
import 'package:news_app_figma/constants/fonts.dart';
import 'package:news_app_figma/widgets/caraousel_container.dart';
import 'package:news_app_figma/widgets/catagory_button.dart';
import 'package:news_app_figma/widgets/list_container.dart';
import 'package:news_app_figma/widgets/search_box.dart';

import '../widgets/bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
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
    'Health',
    'Entertainment',
    'Technology',
    'Sport',
    'Politics'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(children: [
            SingleChildScrollView(
              child: Column(
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
                          children: const [
                            Flexible(
                              child: SearchBox(
                                icon: Icons.search,
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
                        decoration: BoxDecoration(
                          color: AppColor().primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.notification_add_outlined,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // Latest news and see all
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    items: imgList
                        .map((e) =>
                            CaraouselContainer(isBorderRadius: true, image: e))
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
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryList.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CategoryButton(
                            color: AppColor().primary,
                            height: 40,
                            width: categoryList[index].length < 7 ? 80 : 120,
                            text: categoryList[index],
                          ),
                        );
                      }),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // List of Containers News ..

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.maxFinite,
                    child: ListView.builder(
                        itemCount: imgList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: 10,
                            ),
                            child: ListContainer(
                              image: imgList[index],
                              headline: 'This is headline',
                              author: 'Sandeep',
                              dateAndTime: '14/01/2023',
                            ),
                          );
                        }),
                  ),
                ],
              ),
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
          ]),
        ),
      ),
    );
  }
}
