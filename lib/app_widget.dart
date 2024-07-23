import 'package:flutter/material.dart';
import 'src/modules/splash/splash_page.dart';
import 'src/modules/views/onboarding/onboarding_page.dart'; // verificar pra unir os imports de tela
import 'src/shared/themes/themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'smaart recycling',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.strongGreen),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/onboard': (context) => const OnboardingPage(),
      },
    );
  }
}
