import 'package:flutter/material.dart';
import 'package:splash_view/source/source.dart';
import '../../../shared/themes/themes.dart';
import 'splash_page_controller.dart';
import '../views.dart';

/// Pagina responsável pela SplashPage (inicio da aplicação)
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
        /// Neste trecho FutureBuilder é usado para recuperar o valor de validatePrefs que carrega na shared Preferences true ou false para escolha do usuário em ver novamente a OnboardScreen.
        FutureBuilder(
          future: splashPageController.validatePrefs(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == true) {
                return const ChatPage();
              } else {
                return const OnboardingPage();
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
