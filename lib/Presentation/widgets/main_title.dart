import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';

class MainTitle extends StatelessWidget {
  final String title;
  const MainTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: kWhiteColor, fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
