import 'package:flutter/material.dart';
import 'package:netflix_app/Presentation/downloads/screen_downloads.dart';
import 'package:netflix_app/Presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix_app/Presentation/home/screen_home.dart';
import 'package:netflix_app/Presentation/main_page/widgets/bottom_navigation.dart';
import 'package:netflix_app/Presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix_app/Presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});
  final _pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationWidgets(),
    );
  }
}
