import 'package:flutter/material.dart';

import 'package:news_app_figma/screens/home_page.dart';
import 'package:news_app_figma/widgets/caraousel_container.dart';

class NewsDetail extends StatelessWidget {
  const NewsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(fit: StackFit.loose, children: [
            // Background Image, comment

            // Container(
            //   height: MediaQuery.of(context).size.height / 3,
            //   width: MediaQuery.of(context).size.width,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: NetworkImage(
            //         HomePage.imgList[0],
            //       ),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),

            CaraouselContainer(
                isBorderRadius: false, image: HomePage.imgList[1]),

            // News Detail Card
            Positioned(
              top: 230,
              // right: 40,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Text(
                                'This is News ' * 1000,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
