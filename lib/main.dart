import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:provider/provider.dart';
import 'package:smart_recycling/src/shared/models/recycle_model.dart';
import 'app_widget.dart';

Map<String, dynamic>? config;

/// A classe principal da aplicação
void main() async {
  /// Inicializa o Gemini
  WidgetsFlutterBinding.ensureInitialized();

  /// Carrega as credenciais
  await loadConfig();
  Gemini.init(apiKey: config?['GEMINI_KEY']);

  runApp(
    ChangeNotifierProvider(
      create: (context) => RecycleModel(),
      child: const AppWidget(),
    ),
  );
}

/// Método responsavel por obter as credenciais do Google Gemini para autenticar no serviço é imediatamente iniciada.
Future<void> loadConfig() async {
  final contents = await rootBundle.loadString('secrets.json');
  config = json.decode(contents);
}
