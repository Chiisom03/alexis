import 'package:alexis/ui/components/text_widgets.dart';
import 'package:alexis/ui/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Alexis());
}

class Alexis extends StatelessWidget {
  const Alexis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Raisonne'),
            home: const PlaySongPage(),
          );
        });
  }
}
