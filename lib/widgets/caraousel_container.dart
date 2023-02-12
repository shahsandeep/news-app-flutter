import 'package:flutter/material.dart';
import 'package:news_app_figma/constants/fonts.dart';

class CaraouselContainer extends StatelessWidget {
  final String image;
  final bool isBorderRadius;
  final String author;
  final String headline;
  final String body;
  const CaraouselContainer({
    required this.isBorderRadius,
    required this.image,
    required this.author,
    required this.body,
    required this.headline,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width * 7,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
        // color: Colors.red,
        borderRadius: isBorderRadius
            ? BorderRadius.circular(20)
            : BorderRadius.circular(0),
      ),
      child: Stack(
        children: [
          Container(
            height: 400,
            width: MediaQuery.of(context).size.width * 7,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: isBorderRadius
                  ? BorderRadius.circular(20)
                  : BorderRadius.circular(0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 30,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        author,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: AppFont().nunito,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        headline,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: AppFont().neYork,
                            fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        body,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: AppFont().nunito,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
