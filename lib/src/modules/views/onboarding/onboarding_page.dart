import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:smart_recycling/src/shared/themes/themes.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color kDarkBlueColor =
        const Color(0xFF053149); // TODO remover apos ajustes
    return OnBoardingSlider(
      finishButtonText: 'começar',
      onFinish: () {
        // Navigator.push(
        //   context,
        //   // CupertinoPageRoute(
        //   //   builder: (context) => const RegisterPage(),
        //   // ),
        // );
      },
      finishButtonStyle: FinishButtonStyle(
        backgroundColor: kDarkBlueColor,
      ),
      skipTextButton: Text(
        'Pular',
        style: TextStyle(
          fontSize: 16,
          color: kDarkBlueColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      // trailing: Container(),
      trailing: Text(
        'comecar e não repetir',
        style: TextStyle(
          fontSize: 16,
          color: kDarkBlueColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      // trailingFunction: () {
      //   // Navigator.push(
      //   //   context,
      //   //   CupertinoPageRoute(
      //   //     builder: (context) => const LoginPage(),
      //   //   ),
      //   // );
      // },
      controllerColor: kDarkBlueColor,
      totalPage: 3,
      headerBackgroundColor: Color.fromARGB(0, 244, 235, 222),
      // pageBackgroundColor: Colors.white,
      // centerBackground: true,
      background: [
        // Image.asset(
        //   'assets/slide_1.png',
        //   height: 400,
        // ),
        // Image.asset(
        //   'assets/slide_2.png',
        //   height: 400,
        // ),
        // Image.asset(
        //   'assets/slide_3.png',
        //   height: 400,
        // ),
        Image.network(
          'https://marketplace.canva.com/EAFkV91NMeE/1/0/900w/canva-imagem-tela-de-celular-colorida-astronauta-no-espa%C3%A7o-WigKotvacrw.jpg',
          fit: BoxFit.cover,
        ),
        Image.network(
          'https://wallpaper.forfun.com/fetch/0f/0faffa5239e20701db8c7de8a72be9b8.jpeg',
          fit: BoxFit.cover,
        ),
        Image.network(
          'https://i.pinimg.com/236x/5a/78/5a/5a785aca279cdf5948c24eb8588a7e62.jpg',
          fit: BoxFit.cover,
        ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                'Titulo AAA',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'sub titulo aaa',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                'Titulo BBB',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'sub titulo bbb',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                'Titulo Final',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'sub titulo final',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
