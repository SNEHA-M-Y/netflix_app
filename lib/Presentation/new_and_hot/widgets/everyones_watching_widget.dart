import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/Presentation/main_page/widgets/custom_button_widget.dart';
import 'package:netflix_app/Presentation/widgets/video_widgets.dart';

class EveryonesWatchingWidget extends StatelessWidget {

   final String posterPath;
  final String movieName;
  final String description;

  const EveryonesWatchingWidget({super.key,
   required this.posterPath,
    required this.movieName,
     required this.description});
 

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        kheight10,
        const Text(
          "Friends",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kheight10,
        const Text(
          "This hit sitcom follows the merry misadventures of six 20-something pals as the navigate the pitfalls of work,life and love in 1990s Manhatton.",
          style: TextStyle(color: kGreyColor),
        ),
        kheight50,
        const VideoWidget(url: NewAndHotTempImage,),
        kheight10,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
              icon: Icons.near_me_rounded,
              title: "Share",
              iconSize: 25,
              textSize: 16,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: "My List",
              iconSize: 25,
              textSize: 16,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: "Play",
              iconSize: 25,
              textSize: 16,
            ),
            kWidth,
          ],
        )
      ],
    );
  }
}
