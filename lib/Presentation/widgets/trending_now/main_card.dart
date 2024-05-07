import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';

class MainCard extends StatelessWidget {
  final int index;
  MainCard({
    super.key, required this.index,
  });

final  List TrendingnowImages = [
    "/fdZpvODTX5wwkD0ikZNaClE4AoW.jpg",
    "/zK2sFxZcelHJRPVr242rxy5VK4T.jpg",
    "/gKkl37BQuKTanygYQG1pyYgLVgf.jpg",
    "/dY98PkUAbIGUUg0FhXEcOkbzHIZ.jpg",
    "/gxVcBc4VM0kAg9wX4HVg6KJHG46.jpg",
    "/wTW2t8ocWDlHns8I7vQxuqkyK58.jpg",
    "/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg",
    "/u3YQJctMzFN2wAvnkmXy41bXhFv.jpg",
    "/a4Zb13jow8RqJkYFgCUSdmzJCWq.jpg",
     "/aBkqu7EddWK7qmY4grL4I6edx2h.jpg",

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
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('$ImageAppendUrl${TrendingnowImages[index]}'
               // "https://image.tmdb.org/t/p/original/95p65Eb3meuWj8DhldOeIz3LPF.jpg",
              ),
            ),
          ),
        ),
        kWidth,
      ],
    );
  }
}
