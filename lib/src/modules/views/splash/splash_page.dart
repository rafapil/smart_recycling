import 'dart:async';
import 'package:flutter/material.dart';
import '../../../shared/themes/themes.dart';
import 'splash_page_controller.dart';

/// Pagina responsável pela SplashPage (inicio da aplicação)
class SplashPage extends StatefulWidget {
  final SplashPageController controller;

  const SplashPage({super.key, required this.controller});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () async {
      if (await widget.controller.validatePrefs()) {
        // ignore: use_build_context_synchronously
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/add', (Route<dynamic> route) => false);
      } else {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/onboard', (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        AppImages.backgroundImageApp,
        fit: BoxFit.fill,
        height: double.infinity,
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.logoImageApp,
              fit: BoxFit.contain,
              height: 160,
            ),
            const CircularProgressIndicator(
              color: AppColors.strongGreen,
              valueColor: AlwaysStoppedAnimation(AppColors.strongGreen),
              strokeWidth: 3.0,
            ),
          ],
        ),
      ),
    ]);
  }
}
