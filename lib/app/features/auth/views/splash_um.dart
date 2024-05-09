import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashUm extends StatelessWidget {
  const SplashUm({super.key});

  static final name = '$SplashUm';
  static void go(BuildContext context) => context.goNamed(name);

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

