import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/helpers/news.dart';
import 'package:news_app/screens/category_news_screen.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'widgets/tab_screen_widget.dart';
import 'utils/const.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // status bar color
    ),
  );
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: News(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Soulll News',
        theme: Constants.lightTheme,
        darkTheme: Constants.darkTheme,
        initialRoute: '/',
        routes: {
          '/': (ctx) => TabScreen(),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (ctx) => HomeScreen(),
          );
        },
      ),
    );
  }
}
