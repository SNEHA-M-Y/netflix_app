import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_app/Presentation/new_and_hot/widgets/everyones_watching_widget.dart';
import 'package:netflix_app/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/Presentation/new_and_hot/widgets/coming_soon_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(90),
              child: AppBar(
                title: const Text(
                  "New & Hot",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: kWhiteColor),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.cast_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  kWidth,
                  Container(
                    color: Colors.blue,
                    width: 30,
                    height: 30,
                  ),
                  kWidth,
                ],
                bottom: TabBar(
                  indicatorPadding: EdgeInsets.symmetric(horizontal: -30),
                  labelColor: kBlackColor,
                  unselectedLabelColor: kWhiteColor,
                  isScrollable: true,
                  labelStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: kRadius30,
                  ),
                  tabs: [
                    Tab(
                      text: "🍿  Coming Soon",
                    ),
                    Tab(
                      text: "👀 Everyone's Watching",
                    )
                  ],
                ),
              )),
          body: TabBarView(children: [
            ComingSoonList(
              key: Key('coming_soon'),
            ),
            EveryonesWatchingList(key: Key('everyones_watching'),)
            //_buildEveryonesWatching(),
          ]
          ),
          ),
    );
  }

//   Widget _buildComingSoon() {
//     return ListView.builder(
//       itemBuilder: (BuildContext context, index) => const ComingSoonWidget(),
//       itemCount: 10,
//     );
//   }

  Widget _buildEveryonesWatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, index) => SizedBox(),
    );
    //   const EveryonesWatchingWidget());
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HotAndNewBloc>(context).add(LoadDataInComingSoon());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.hasError) {
          return Center(child: Text("Error While Loading ComingSoon List"));
        } else if (state.comingSoonList.isEmpty) {
          return Center(child: Text("ComingSoon List Is Empty"));
        } else {
          return ListView.builder(
              itemCount: state.comingSoonList.length,
              itemBuilder: (BuildContext context, index) {
                final movie = state.comingSoonList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }

                String month = '';
                String date = '';

                try {
                  final _date = DateTime.tryParse(movie.releaseDate.toString());
                  final formatedDate = DateFormat.yMMMd('en_US').format(_date!);
                  month = formatedDate
                      .split(" ")
                      .first
                      .substring(0, 3)
                      .toUpperCase();

                  date = movie.releaseDate!.split('-')[1];
                } catch (_) {
                  month = '';
                  date = '';
                }
                log( DateTime.tryParse(movie.releaseDate.toString()).toString());

                return ComingSoonWidget(
                    id: movie.id.toString(),
                    month: month,
                    day: date,
                    posterPath: '$ImageAppendUrl${movie.posterPath}',
                    movieName: movie.originalTitle ?? 'No title',
                    description: movie.overview ?? 'No Description');
              });
        }
      },
    );
  }
}




class EveryonesWatchingList extends StatelessWidget {
  const EveryonesWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(LoadDataInEveryOneIsWatching());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.hasError) {
          return Center(child: Text("Error While Loading EveryOnesWatchingList"));
        } else if (state.everyOneIsWatchingList.isEmpty) {
          return Center(child: Text("EveryOnesWatchingList Is Empty"));
        } else {
          return ListView.builder(
              itemCount: state.everyOneIsWatchingList.length,
              itemBuilder: (BuildContext context, index) {
                final movie = state.everyOneIsWatchingList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                return EveryonesWatchingWidget(
                  
                    posterPath: '$ImageAppendUrl${movie.backdropPath}',
                    movieName: movie.originalName ?? 'No title',
                    description: movie.overview ?? 'No Description');
              });
        }
      },
    );
  }
}
