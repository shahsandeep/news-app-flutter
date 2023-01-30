import 'package:flutter/material.dart';
import 'package:news_app_figma/constants/fonts.dart';

class CaraouselContainer extends StatelessWidget {
  final String image;
  final bool isBorderRadius;
  const CaraouselContainer(
      {required this.isBorderRadius, required this.image, super.key});

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
      padding: const EdgeInsets.only(
        left: 2,
        right: 2,
        top: 80,
        bottom: 5,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Author Sandeep',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: AppFont().nunito,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'This is News Headline',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: AppFont().neYork,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'This is News body body body bod body body boyd',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: AppFont().nunito,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
