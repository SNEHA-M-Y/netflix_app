import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';

class MainCard extends StatelessWidget {
   final int index;
   MainCard({
    super.key, required this.index,
  });

  final SouthIndianCinemasImages=[
     "/6WxsV3fdvqqKuCkYoWNVzgaik9L.jpg",
     "/q8UfM4H5Z8nSXomlXgHxRtwznVx.jpg",
      "/eVcOSgM2mrsQ6Kqp93adTgK2uIy.jpg",
       "/iZoLfix1ijLZVbyztcM1AICRiSJ.jpg",
       "/iUgeT99RHVdqkExrW7X0poE0BIB.jpg",
        "/n1pDcXST1I137DcUjWUv1Ar13TW.jpg",
         "/e7E9mFsCwm6s5k0akviOIuVIKIU.jpg",
          "/bLKtWBSVsPJMSw9xipslImhCOKd.jpg",
           "/AkwqBpJVfi31HG2xoqlks3pLXN8.jpg",
            "/tALEStUhrsNx0xvC9psLkey2O0A.jpg",
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
              image: NetworkImage('$ImageAppendUrl${SouthIndianCinemasImages[index]}'
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
