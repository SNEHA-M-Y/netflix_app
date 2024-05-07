

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/Presentation/main_page/widgets/custom_button_widget.dart';
import 'package:netflix_app/Presentation/widgets/video_widgets.dart';

class ComingSoonWidget extends StatelessWidget {

  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget({super.key, required this.id, 
  required this.month,
   required this.day,
    required this.posterPath, 
    required this.movieName,
     required this.description});
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                month,
                style: TextStyle(fontSize: 16, color: kGreyColor),
              ),
              Text(
              day,
                style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 4,color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               VideoWidget(url: posterPath,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Expanded(
                     child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        //  letterSpacing: -5,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                                       ),
                   ),
                  //const Spacer(),
                 // Row(
                   // children: const [
                       CustomButtonWidget(
                         icon: Icons.notifications,
                        title: "Remind Me",
                        iconSize: 20,
                         textSize: 12,
                       ),
                       kWidth,
                       CustomButtonWidget(
                         icon: Icons.info,
                         title: "Info",
                         iconSize: 20,
                        textSize: 12,
                       ),
                      kWidth,
              //       ],
              //     ),
                ],
              ),
              kheight10,
               Text("Coming on $day $month",style: TextStyle(color: Colors.white),),
              kheight10,
               Text(
               movieName,
               maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              kheight10,
              Text(
                description,
                maxLines: 4,
                style: TextStyle(color: kGreyColor),
              )
            ],
              )
          //   ],
          
          // ),
        )
      ],
    );
  }
}
