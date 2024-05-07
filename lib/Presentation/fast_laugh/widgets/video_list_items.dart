import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_app/Domain/downloads/models/downloads.dart';
import 'package:netflix_app/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  VideoListItemInheritedWidget({
    Key? key,
    required this.widget,
    required this.movieData,
  }) : super(child: widget);

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItems extends StatelessWidget {
  final int index;
  const VideoListItems({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
    final videoUrl = dummyVideoUrls[index % dummyVideoUrls.length];
    return Stack(
      children: [
        // Container(
        //   color: Colors.accents[index % Colors.accents.length],
        // ),
        FastLaughVideoPlayer(videoUrl: videoUrl, onStatechanged: (bool) {}),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// left side

                CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black38,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.volume_off_outlined,
                          color: kWhiteColor,
                          size: 30,
                        ))),

                ///right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: posterPath == null
                            ? null
                            : NetworkImage('$ImageAppendUrl$posterPath'
                                // "https://image.tmdb.org/t/p/original/snQLwRrfQAl5YFKVefZq9Lbscki.jpg"),
                                ),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: likedVideosIdsNotifier,
                      builder: (BuildContext c, Set<int> newlikedListIds,
                          Widget? _) {
                        final _index = index;
                        if (newlikedListIds.contains(_index)) {
                          return GestureDetector(
                            onTap: () {
                              // BlocProvider.of<FastLaughBloc>(context).add(UnlikeVideo(id: _index));
                              likedVideosIdsNotifier.value.remove(_index);
                              likedVideosIdsNotifier.notifyListeners();
                            },
                            child: VideoActionsWidget(
                                icon: Icons.favorite,iconColor: (Colors.red), title: "Liked"),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            likedVideosIdsNotifier.value.add(_index);
                            likedVideosIdsNotifier.notifyListeners();
                            //  BlocProvider.of<FastLaughBloc>(context).add(LikeVideo(id: _index));
                          },
                          child: VideoActionsWidget(
                              icon: Icons.emoji_emotions_outlined,
                              title: "LOL"),
                        );
                      },
                    ),
                    const VideoActionsWidget(
                        icon: Icons.add_outlined, title: "My List"),
                    GestureDetector(
                      onTap: () {
                        log("Share Clicked");
                        final movie = VideoListItemInheritedWidget.of(context)
                            ?.movieData
                            .posterPath;
                        log(videoUrl.toString());
                        if (videoUrl != null) {
                          Share.share(videoUrl);
                        }
                      },
                      child: VideoActionsWidget(
                          icon: Icons.near_me_outlined, title: "Share"),
                    ),
                    VideoActionsWidget(icon: Icons.play_arrow, title: "Play")
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconColor;
  const VideoActionsWidget(
      {super.key, required this.icon, required this.title, this.iconColor=(Colors.white)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                icon,
                color: iconColor,
                size: 30,
              )),
          Text(
            title,
            style: TextStyle(color: kWhiteColor, fontSize: 16),
          )
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isplaying) onStatechanged;
  const FastLaughVideoPlayer(
      {super.key, required this.videoUrl,
       required this.onStatechanged});

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: (VideoPlayer(_videoPlayerController)),
            )
          : Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
  }
}
