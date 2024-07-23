import 'package:flutter/material.dart';
// import 'package:smart_recycling/src/shared/themes/themes.dart';
import 'package:splash_view/source/source.dart';

import '../../shared/themes/themes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashView(
      backgroundImageDecoration: const BackgroundImageDecoration(
        image: AssetImage(AppImages.backgroundImageApp),
      ),
      loadingIndicator: const CircularProgressIndicator(),
      logo: Image.asset(AppImages.logoImageApp),
      // done: Done(Navigator.pushReplacementNamed(context, '/home')), // problemas precisa identifiar na sharedPrefs que é primeira vez no onboard antes de entrar em um if da vida
    );
  }
}
