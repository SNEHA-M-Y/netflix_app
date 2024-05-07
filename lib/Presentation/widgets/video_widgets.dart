import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';

class VideoWidget extends StatelessWidget {

final String? url;

  const VideoWidget({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            url!,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.black38,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.volume_off_outlined,
                    color: kWhiteColor,
                    size: 20,
                  ))),
        ),
      ],
    );
  }
}
