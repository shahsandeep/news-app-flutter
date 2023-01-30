import 'package:flutter/material.dart';

class ListContainer extends StatelessWidget {
  final String image;
  final String headline;
  final String dateAndTime;
  final String author;
  const ListContainer(
      {required this.image,
      required this.headline,
      required this.author,
      required this.dateAndTime,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  headline,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 85.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  author,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  dateAndTime,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
