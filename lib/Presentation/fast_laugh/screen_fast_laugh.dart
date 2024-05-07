import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/Presentation/fast_laugh/widgets/video_list_items.dart';
import 'package:netflix_app/application/fast_laugh/fast_laugh_bloc.dart';

//import 'package:netflix_app/application/search/search_bloc.dart';
// import 'package:netflix_app/Presentation/fast_laugh/widgets/video_list_items.dart';
class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FastLaughBloc, FastLaughState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const CircularProgressIndicator(
                strokeWidth: 2,
              );
            } else if (state.isError) {
              return Center(
                child: Text("Error While getting data"),
              );
            } else if (state.videoList.isEmpty) {
              return Center(
                child: Text("Video List is empty"),
              );
            } else {
              return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(
                  state.videoList.length,
                  (index) => VideoListItemInheritedWidget(
                    widget: VideoListItems(
                      key: Key(
                        index.toString(),
                      ),
                      index: index,
                    ),
                    movieData: state.videoList[index],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
