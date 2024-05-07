import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';

class NumberCard extends StatelessWidget {
  NumberCard({super.key, required this.index});
  final int index;
  final List ToptenTvShowsInIndiaImages = [
    "/onmSVwYsPMYtO8OjLdjS8FfRNKb.jpg",
    "/KoYWXbnYuS3b0GyQPkbuexlVK9.jpg",
    "/jcEl8SISNfGdlQFwLzeEtsjDvpw.jpg",
    "/pNW64pjaHvf6purNaFhq4SHYRfl.jpg",
    "/9Gg1oM8Us8gCS5aJA8e0ZRuIHnf.jpg",
    "/gKG5QGz5Ngf8fgWpBsWtlg5L2SF.jpg",
    "/klL4yhwiU8aF4AuF5dCfJA9sRnS.jpg",
    "/i5hmoRjHNWady4AtAGICTUXknKH.jpg",
    "/6VBNeo8XG90sNKWYQ0yTEmVBXHJ.jpg",
    "/pFqzXacKsi9or1GVdxTLutXD9zM.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 200,
            ),
            Container(
              width: 130,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: kRadius10,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      '$ImageAppendUrl${ToptenTvShowsInIndiaImages[index]}'
                      // "https://image.tmdb.org/t/p/original/95p65Eb3meuWj8DhldOeIz3NLPF.jpg",
                      ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 13,
          bottom: -40,
          child: BorderedText(
            strokeWidth: 10.0,
            strokeColor: kWhiteColor,
            child: Text(
              "${index + 1}",
              style: TextStyle(
                  fontSize: 140,
                  decoration: TextDecoration.none,
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                  decorationColor: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
