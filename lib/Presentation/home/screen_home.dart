import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_app/Presentation/widgets/south_indian_cinema/main_title_card.dart';
import 'package:netflix_app/Presentation/widgets/tense_dramas/main_title_card.dart';
import 'package:netflix_app/Presentation/widgets/trending_now/main_title_card.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/Presentation/main_page/widgets/background_card.dart';
import 'package:netflix_app/Presentation/main_page/widgets/number_title_card.dart';

import 'package:netflix_app/Presentation/widgets/released_in_the_past_year/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      builder: ((context, index, _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            print(direction);
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              ListView(
                children: [
                  BackgroundCard(),
                  MainTitleCardReleasedInThePastYear(title: "Released in the Past Year"),
                  kheight10,
                  MainTitleCardTrendingNow(title: "Trending Now"),
                  kheight10,
                  NumberTitleCard(),
                  kheight10,
                  MainTitleCardTenseDramas(title: "Tense Dramas"),
                  kheight10,
                  MainTitleCardSouthIndianCinema(title: "South Indian Cinema"),
                  kheight10,
                ],
              ),
              scrollNotifier.value == true
                  ? AnimatedContainer(
                      duration: const Duration(microseconds: 1000),
                      width: double.infinity,
                      height: 90,
                      color: Colors.black.withOpacity(0.3),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "images/netflixlogo.png",
                                width: 60,
                                height: 60,
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
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "TV Shows",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Movies",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Categories",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  : kheight10,
            ],
          ),
        );
      }),
      valueListenable: scrollNotifier,
    ));
  }
}
