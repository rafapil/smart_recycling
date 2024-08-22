import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_recycling/src/modules/views/views.dart';
import 'splash_page_controller_test.mocks.mocks.dart';

void main() {
  late MockSplashPageController mockController;

  setUp(() {
    mockController = MockSplashPageController();
  });

  testWidgets('Navigates to OnboardingPage when seen is false',
      (WidgetTester tester) async {
    // Configura o mock para retornar false
    when(mockController.validatePrefs()).thenAnswer((_) async => false);

    // Inicializa o AppWidget no teste
    await tester.pumpWidget(
      MaterialApp(
        home: SplashPage(controller: mockController),
        routes: {
          '/onboard': (context) => const OnboardingPage(),
          '/add': (context) => const InsertRecyclePage(),
        },
      ),
    );

    // Avança o tempo artificialmente para que o Timer na SplashPage complete
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle(); // Espera a animação de navegação

    // Verifica se a navegação ocorreu para a OnboardingPage
    expect(find.byType(OnboardingPage), findsOneWidget);
  });

  // TODO: Implementar ajustes para o provider e ajustar testes
  // testWidgets('Navigates to Add Page when seen is true',
  //     (WidgetTester tester) async {
  //   // Configura o mock para retornar true
  //   when(mockController.validatePrefs()).thenAnswer((_) async => true);

  //   // Inicializa o AppWidget no teste
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: SplashPage(controller: mockController),
  //       routes: {
  //         '/onboard': (context) => const OnboardingPage(),
  //         '/add': (context) => const InsertRecyclePage(),
  //       },
  //     ),
  //   );

  //   // Avança o tempo artificialmente para que o Timer na SplashPage complete
  //   await tester.pump(const Duration(seconds: 3));
  //   await tester.pumpAndSettle(); // Espera a animação de navegação

  //   // Verifica se a navegação ocorreu para a ChatPage
  //   expect(find.byType(InsertRecyclePage), findsOneWidget);
  // });
}
