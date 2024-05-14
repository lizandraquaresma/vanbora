import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'splash_dois.dart';

class SplashUm extends StatelessWidget {
  const SplashUm({super.key});

  static final name = '$SplashUm';
  static void go(BuildContext context) => context.goNamed(name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset('/icons/van.png'),
              ),
              const Center(
                child: Text(
                  textAlign: TextAlign.center,
                  // ignore: lines_longer_than_80_chars
                  'Bem-vindo ao VANBORA! Aqui, tornamos suas viagens mais eficientes. Explore rotas, compre passagens e desfrute de uma jornada simplificada.',
                ),
              ),
              const Gap(80),
              FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  backgroundColor: const Color.fromRGBO(255, 179, 46, 1),
                ),
                onPressed: () {
                  SplashDois.go(context);
                },
                child: const Text('Prosseguir'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
