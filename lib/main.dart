/////////////////////////////////////////////////////////////////////////////
/* Author      : Mahmoud Makhlouf                                          */
/* Date        : 10 Sep 2021                                               */
/* Description : Facebook Ui Feeds Page For Mobile And Web                 */
/* Version     : V1.0.0                                                    */
/////////////////////////////////////////////////////////////////////////////

import 'package:facebook/bloc_observer.dart';
import 'package:facebook/presentation_layer/screens/web_feeds_screen.dart';
import 'package:facebook/presentation_layer/screens/mobile_feeds_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            toolbarTextStyle: TextStyle(color: Colors.black),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ),
            elevation: 0.0,
          )),
      home: LayoutBuilder(
        builder: (context, constrains) {
          print(constrains.minWidth);
          if (constrains.minWidth >= 602) {
            return FacebookWeb();
          } else {
            return FacebookMobileScreen();
          }
        },
      ),
    );
  }
}
