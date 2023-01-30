import 'package:flutter/material.dart';
import 'package:news_app_figma/constants/colors.dart';
import 'package:news_app_figma/screens/home_page.dart';
import 'package:news_app_figma/widgets/catagory_button.dart';
import 'package:news_app_figma/widgets/list_container.dart';

import 'package:news_app_figma/widgets/search_box.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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

              const SearchBox(icon: Icons.clear),
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
              Expanded(
                child: ListView.builder(
                    itemCount: HomePage.imgList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ListContainer(
                          image: HomePage.imgList[index],
                          headline: 'This is Headline',
                          author: 'Sandeep',
                          dateAndTime: '15/01/2023',
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
