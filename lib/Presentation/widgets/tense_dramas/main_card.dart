import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';

class MainCard extends StatelessWidget {
  final int index;
   MainCard({
    super.key, required this.index,
  });
  final TenseDramaImages=[

     "/1DTP1Ph4uzNO6ofRUm7eAimWoKD.jpg",
     "/hu40Uxp9WtpL34jv3zyWLb5zEVY.jpg",
     "/kDp1vUBnMpe8ak4rjgl3cLELqjU.jpg",
     "/cxevDYdeFkiixRShbObdwAHBZry.jpg",
     "/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg",
     "/fdZpvODTX5wwkD0ikZNaClE4AoW.jpg",
     "/gKkl37BQuKTanygYQG1pyYgLVgf.jpg",
     "/zK2sFxZcelHJRPVr242rxy5VK4T.jpg",
     "/ldfCF9RhR40mppkzmftxapaHeTo.jpg",
      "/upKD8UbH8vQ798aMWgwMxV8t4yk.jpg",

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
              image: NetworkImage('$ImageAppendUrl${TenseDramaImages[index]}'
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
