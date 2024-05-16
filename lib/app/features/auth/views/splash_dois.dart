import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/constants/assets.dart';
import 'login_page.dart';

class SplashDois extends StatelessWidget {
  const SplashDois({super.key});

  static final name = '$SplashDois';
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
                child: Image.asset(AssetIcons.world),
              ),
              const Gap(24),
              const Center(
                child: Text(
                  textAlign: TextAlign.center,
                  // ignore: lines_longer_than_80_chars
                  'Explore o poder da geolocalização!  Você pode encontrar rotas de van próximas, comprar passagens e embarcar em sua jornada com confiança.',
                ),
              ),
              const Gap(24),
              const Center(
                child: Text(
                  textAlign: TextAlign.center,
                  'Bem-vindo a uma maneira mais inteligente de viajar.',
                ),
              ),
              const Gap(40),
              FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  backgroundColor: const Color.fromRGBO(255, 179, 46, 1),
                ),
                onPressed: () {
                  LoginPage.go(context);
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
