import 'package:flutter/material.dart';

import 'package:news_app_figma/constants/fonts.dart';

class SearchBox extends StatelessWidget {
  final IconData icon;
  const SearchBox({required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          left: 10,
        ),
        hintText: 'Enter text to search...',
        hintStyle: TextStyle(fontFamily: AppFont().nunito),
        suffixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
