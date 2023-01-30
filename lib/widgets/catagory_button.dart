import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final Color color;
  const CategoryButton(
      {required this.color,
      required this.text,
      required this.height,
      required this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height ?? 40,
      width: width ?? 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
