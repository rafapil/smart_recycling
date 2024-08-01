import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:smart_recycling/src/modules/views/onboarding/onboard_page_controller.dart';
import 'package:smart_recycling/src/shared/themes/themes.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardPageController onboardPageController = OnboardPageController();
    var widthScreen = MediaQuery.of(context).size.width;

    return OnBoardingSlider(
      finishButtonText: 'começar',
      onFinish: () {
        onboardPageController.setPrefsToComplete().whenComplete(() {
          Navigator.pushReplacementNamed(context, '/add');
        });
      },
      finishButtonStyle: const FinishButtonStyle(
        backgroundColor: AppColors.strongGreen,
      ),
      skipTextButton: Text(
        'Pular',
        style: AppTextStyles.txtTextForm,
      ),
      trailing: Text(
        'comecar e repetir novamente',
        style: AppTextStyles.txtTextForm,
      ),
      trailingFunction: () {
        Navigator.pushReplacementNamed(context, '/add');
      },
      controllerColor: AppColors.lightGreen,
      totalPage: 3,
      headerBackgroundColor: const Color.fromARGB(0, 244, 235, 222),
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
          width: widthScreen,
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
                style: AppTextStyles.txtTitle,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'sub titulo aaa',
                textAlign: TextAlign.center,
                style: AppTextStyles.txtSubTitle,
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: widthScreen,
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
                style: AppTextStyles.txtTitle,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'sub titulo bbb',
                textAlign: TextAlign.center,
                style: AppTextStyles.txtSubTitle,
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: widthScreen,
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
                style: AppTextStyles.txtTitle,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'sub titulo final',
                textAlign: TextAlign.center,
                style: AppTextStyles.txtSubTitle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
