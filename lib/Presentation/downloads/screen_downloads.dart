import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/Domain/downloads/models/downloads.dart';
import 'package:netflix_app/application/downloads/downloads_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/Presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: "Downloads",
          )),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const _SmartDownloads(),
            kheight30,
            body1(),
            kheight30,
            body2()
          ],
        ),
      ),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.settings_outlined,
          color: kWhiteColor,
        ),
        kWidth,
        Text(
          "Smart Downloads",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}

class body1 extends StatelessWidget {
  body1({super.key});
//  final List images = [
//      "https://image.tmdb.org/t/p/original/jlYPimzNuhokY4WfnuVTiNXMixA.jpg",
//      "https://image.tmdb.org/t/p/original/s5HBKH7hNo8EElJTFQPEDwYgXhG.jpg",
//      "https://image.tmdb.org/t/p/original/snQLwRrfQAl5YFKVefZq9Lbscki.jpg",
//    ];

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   BlocProvider.of<DownloadsBloc>(context).add(const DownloadsEvent.getDownloadsImage());
    // });
    BlocProvider.of<DownloadsBloc>(context)
        .add(const DownloadsEvent.getDownloadsImage());

    return Column(
      children: [
        Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
        Text(
          "We will download a personalised selection of \nmovies and shows for you,so there's \nalways something to watch on your \ndevice.",
          textAlign: TextAlign.center,
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: double.infinity,
              height: 300,
              child: state.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                      color: KBlueColor,
                    ))
                  : Stack(
                      children: [
                        CircleAvatar(
                          radius: 140,
                          backgroundColor: Colors.white30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 170),
                          child: Transform.rotate(
                            angle: 25 * pi / 180,
                            child: Container(
                              width: 125,
                              height: 187,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          '$ImageAppendUrl${state.downloads?[2].posterPath}'),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 170),
                          child: Transform.rotate(
                            angle: -25 * pi / 180,
                            child: Container(
                              width: 125,
                              height: 187,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          '$ImageAppendUrl${state.downloads?[1].posterPath}'),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        Container(
                          width: 143.75,
                          height: 215.05,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      '$ImageAppendUrl${state.downloads?[0].posterPath}'),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ],
                      alignment: Alignment.center,
                    ),
            );
          },
        ),
      ],
    );
  }
}

class body2 extends StatelessWidget {
  const body2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonColorBlue,
            onPressed: () {},
            child: const Text(
              "Set up",
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        MaterialButton(
          color: kButtonColorWhite,
          onPressed: () {},
          child: const Text(
            "See what you can download",
            style: TextStyle(
                color: kBlackColor, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
