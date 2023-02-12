import 'package:flutter/material.dart';

import 'package:news_app_figma/constants/fonts.dart';

class SearchBox extends StatelessWidget {
  final IconData? icon;
  final bool? isEnable;
  final bool isButton;
  final TextEditingController? controller;

  final IconButton? iconButton;
  const SearchBox(
      {required this.icon,
      this.isEnable = true,
      this.isButton = false,
      this.iconButton,
      this.controller,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: isEnable,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          left: 10,
        ),
        hintText: 'Enter text to search...',
        hintStyle: TextStyle(fontFamily: AppFont().nunito),
        suffixIcon: isButton ? iconButton : Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
