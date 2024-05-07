import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';

class MainCard extends StatelessWidget {
  final int index;
 MainCard({
    super.key, required this.index,
  });

  final List ReleasedInThePastYerImages=[
     "/yRt7MGBElkLQOYRvLTT1b3B1rcp.jpg",
      "/m3bwUWLBe5ogVB8HmpQs2YNNq3S.jpg",
      "/H6vke7zGiuLsz4v4RPeReb9rsv.jpg",
      "/vSzOobYVu16MogSALNg1bjTaGc.jpg",
       "/4lhR4L2vzzjl68P1zJyCH755Oz4.jpg",
       "/gAEUXC37vl1SnM7PXsHTF23I2vq.jpg",
       "/uaCd0qvQQIRKcTB4j4Qt02oyrCQ.jpg",
        "/n0GVTNJvhUlJ1Mj73JHZBTHVFuc.jpg",
        "/kLOopsjpSX1Wb1h8Vg57t7YEwD6.jpg",
        "/hUu9zyZmDd8VZegKi1iK1Vk0RYS.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: 130,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: kRadius10,
            image:  DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('$ImageAppendUrl${ReleasedInThePastYerImages[index]}'
               // "https://image.tmdb.org/t/p/original/95p65Eb3meuWj8DhldOeIz3NLPF.jpg",
              ),
            ),
          ),
        ),
        kWidth,
      ],
    );
  }
}
