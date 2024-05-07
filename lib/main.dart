import 'package:flutter/material.dart';
import 'package:netflix_app/Domain/core/di/injectable.dart';
import 'package:netflix_app/application/downloads/downloads_bloc.dart';
import 'package:netflix_app/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_app/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';

import 'package:netflix_app/splashscreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => getIt<DownloadsBloc>(),
      ),
      BlocProvider(
        create: (context) => getIt<SearchBloc>(),
      ),
      BlocProvider(
        create: (context) => getIt<FastLaughBloc>(),
      ),

       BlocProvider(
        create: (context) => getIt<  HotAndNewBloc>(),
      ),
    ],
    //   child: Container(),
    // )(
    child: MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
          scaffoldBackgroundColor: backgroundColor,
          backgroundColor: Colors.black,
          textTheme: TextTheme(
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.white))),
      debugShowCheckedModeBanner: false,
      home: splashscrn(),
    ),
  ));
}
