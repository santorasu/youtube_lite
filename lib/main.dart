import 'package:flutter/material.dart';
import 'package:projects/widget/youtube_lite.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Youtube Lite',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.black,
          centerTitle: true,
          foregroundColor: Colors.white
        ),
      ),
      home: WebViewScreen(),
    );
  }
}
