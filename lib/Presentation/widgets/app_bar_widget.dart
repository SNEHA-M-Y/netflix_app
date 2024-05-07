import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Text(
          title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
        ),
        Spacer(),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.cast_outlined,
              color: Colors.white,
              size: 30,
            )),
        kWidth,
        Container(
          color: Colors.blue,
          width: 30,
          height: 30,
        )
      ],
    );
  }
}
