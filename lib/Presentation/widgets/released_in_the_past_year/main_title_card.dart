import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/Presentation/widgets/released_in_the_past_year/main_card.dart';
import 'package:netflix_app/Presentation/widgets/main_title.dart';

class MainTitleCardReleasedInThePastYear extends StatelessWidget {
  const MainTitleCardReleasedInThePastYear({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(
          title: title,
        ),
        kheight10,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) =>  MainCard(index: index,),
            ),
          ),
        )
      ],
    );
  }
}
