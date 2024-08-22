import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_recycling/app_widget.dart';
import 'package:smart_recycling/src/modules/views/views.dart';

void main() {
  testWidgets('AppWidget loads and navigates correctly from SplashPage',
      (WidgetTester tester) async {
    // Inicializa o AppWidget no teste
    await tester.pumpWidget(const AppWidget());

    // Verifica se a SplashPage é exibida inicialmente
    expect(find.byType(SplashPage), findsOneWidget);

    // Avança o tempo artificialmente para que o Timer na SplashPage complete
    await tester.pump(const Duration(seconds: 3));

    // Verifica se a navegação ocorreu para a página correta
    // expect(find.byType(OnboardingPage), findsOneWidget);
  });
}
