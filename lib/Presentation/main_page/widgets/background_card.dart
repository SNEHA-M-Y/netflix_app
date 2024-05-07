import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/Presentation/main_page/widgets/custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(kMainImage), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(
                  title: "My List",
                  icon: Icons.add,
                ),
                _PlayButton(),
                CustomButtonWidget(icon: Icons.info, title: "Info")
              ],
            ),
          ),
        )
      ],
    );
  }
}

TextButton _PlayButton() {
  return TextButton.icon(
    onPressed: () {},
    style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(kWhiteColor),
        shape: MaterialStatePropertyAll(LinearBorder())),
    icon: const Icon(
      Icons.play_arrow,
      size: 25,
      color: kBlackColor,
    ),
    label: const Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        "Play",
        style: TextStyle(fontSize: 20, color: kBlackColor),
      ),
    ),
  );
}
