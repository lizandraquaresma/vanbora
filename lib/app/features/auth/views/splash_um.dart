import 'package:flutter/material.dart';

class SplashUm extends StatelessWidget {
  const SplashUm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/icons/van.png'),
          const Text('Olá'),
        ],
      ),
    );
  }
}

