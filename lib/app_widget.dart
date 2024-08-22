import 'package:flutter/material.dart';
import 'src/modules/views/views.dart';
import 'src/shared/themes/themes.dart';

/// A classe AppWidget é responsável pelo widget principal
class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'smart recycling',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary, surface: AppColors.strongGreen),
        useMaterial3: true,
      ),

      /// Rota inicial usada pela aplicação
      initialRoute: '/splash',

      /// Rotas da aplicação
      routes: {
        '/splash': (context) => const SplashPage(),
        '/onboard': (context) => const OnboardingPage(),
        '/add': (context) => const InsertRecyclePage(),
        '/chat': (context) => const ChatPage(),
      },
    );
  }
}
