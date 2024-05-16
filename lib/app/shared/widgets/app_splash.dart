import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_colors.dart';
import '../constants/assets.dart';

class AppSplash extends StatelessWidget {
  const AppSplash({super.key});

  static const duration = Duration(seconds: 3);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.light.primary,
        body: Center(
          child: Image.asset(AssetImages.logoAlpha).animate()
                  .fadeIn(delay: 500.ms, duration: 1.2.seconds)
                  .scaleXY(begin: 0.75, curve: Curves.easeOutExpo)
                  .animate(delay: 1.seconds, onPlay: (c) => c.repeat())
                  .shimmer(color: Colors.grey[300], duration: 1200.ms),
        ),
      ),
    );
  }
}
