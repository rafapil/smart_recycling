import 'package:flutter/material.dart';

import 'package:splash_view/source/source.dart';
import '../../shared/themes/themes.dart';
import '../controllers/splash/splash_page_controller.dart';
import '../views/views.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashPageController splashPageController = SplashPageController();

    return SplashView(
      backgroundImageDecoration: const BackgroundImageDecoration(
        image: AssetImage(AppImages.backgroundImageApp),
      ),
      loadingIndicator: const CircularProgressIndicator(),
      logo: Image.asset(AppImages.logoImageApp),
      done: Done(
        FutureBuilder(
          future: splashPageController.validatePrefs(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == true) {
                return ChatPage();
              } else {
                return OnboardingPage();
              }
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
