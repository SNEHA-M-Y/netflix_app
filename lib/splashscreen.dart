import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netflix_app/Presentation/main_page/screen_main_page.dart';

class splashscrn extends StatefulWidget {
  const splashscrn({super.key});

  @override
  State<splashscrn> createState() => _splashscrnState();
}

class _splashscrnState extends State<splashscrn>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 6), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => ScreenMainPage()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(child: Image.asset("images/Wells.gif"))));
  }
}
