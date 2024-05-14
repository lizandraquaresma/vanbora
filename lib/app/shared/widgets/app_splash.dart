import 'package:flutter/material.dart';

class AppSplash extends StatelessWidget {
  const AppSplash({super.key});

  static const duration = Duration(seconds: 3);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Image.asset('/icons/logo.png', width: 180),
        ),
      ),
    );
  }
}
