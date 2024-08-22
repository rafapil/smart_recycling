import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:smart_recycling/src/modules/views/onboarding/onboard_page_controller.dart';
import 'package:smart_recycling/src/shared/themes/themes.dart';

/// A classe OnboardingPage é responsável pelo widget de boas vindas
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardPageController onboardPageController = OnboardPageController();
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;

    return OnBoardingSlider(
      /// Ao clicar em começar a função setPrefsToComplete é chamada atualizando o shared Preferences e assim a pagina de Onboard não aparecera uma segunda vez.
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

      /// A trailing não atualiza o setPrefsToComplete dessa forma o usuário tera acesso novamente a OnboardScreen
      trailing: Text(
        'comecar e repetir novamente',
        style: AppTextStyles.txtTextForm,
      ),

      /// Redireciona para a página chat
      trailingFunction: () {
        Navigator.pushReplacementNamed(context, '/add');
      },
      controllerColor: AppColors.lightGreen,
      totalPage: 3,
      headerBackgroundColor: const Color.fromARGB(0, 244, 235, 222),
      background: [
        Image.asset(
          AppImages.background_1,
          height: heightScreen / 1.2,
          fit: BoxFit.cover,
        ),
        Image.asset(
          AppImages.background_2,
          height: heightScreen / 1.2,
          fit: BoxFit.cover,
        ),
        Image.asset(
          AppImages.background_3,
          height: heightScreen / 1.2,
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
              SizedBox(
                height: heightScreen / 1.38,
              ),
              Text(
                'Bem vindo',
                textAlign: TextAlign.center,
                style: AppTextStyles.txtTitle,
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                'A nova forma de aprender a reciclar',
                textAlign: TextAlign.center,
                style: AppTextStyles.txtSubTitleBlack,
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
              SizedBox(
                height: heightScreen / 1.38,
              ),
              Text(
                'Simples',
                textAlign: TextAlign.center,
                style: AppTextStyles.txtTitle,
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                'Insira as informações a IA fará o resto',
                textAlign: TextAlign.center,
                style: AppTextStyles.txtSubTitleBlack,
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
              SizedBox(
                height: heightScreen / 1.38,
              ),
              Text(
                'Pronto',
                textAlign: TextAlign.center,
                style: AppTextStyles.txtTitle,
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                'Nossa IA mostra tudo o que precisa.',
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
