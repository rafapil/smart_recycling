import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:url_launcher/url_launcher.dart';

/// Controller da ChatPage que cria a mensagem que é encaminhada para o Google Gemini
class ChatPageController {
  final Gemini gemini;

  ChatPageController() : gemini = Gemini.instance;

  /// Cria a mensagem que é encaminhada para o Google Gemini
  Future<String?> createMessageIA(
      String? address, String? selection, XFile? photo) async {
    if (address != null && selection != null && photo != null) {
      try {
        final Uint8List list = await photo.readAsBytes();

        final value = await gemini.textAndImage(
          text: generateQuest(address, selection),
          images: [list],
        );

        String? result = value?.content?.parts?.last.text;

        return result;
      } catch (e) {
        return '<h3>Erro ao processar dados:</h3> <p>$e</p>';
      }
    } else {
      return '<h3>Parâmetros inválidos</h3>';
    }
  }

  /// Gera a pergunta que é encaminhada para o Google Gemini adicionada das informações fornecidas na página de chat
  generateQuest(address, selection) {
    return "Preciso $selection o item da imagem, pode me fornecer informações para tal, ou caso exista algum local que possa me dar orientações ou encaminhar promixos do meu local que é: $address pode buscar estas informações? 'no idioma português brasileiro e colocar a resposta em html com quebra de linhas e destacando os pontos importes com negrito e ajustar o texto para ficar centralizado, essa parte do pedido não deve aparecer na resposta'";
  }

  /// Função que permite redicionar para um link externo caso a resposta do Gemini o forneça.
  redirectURL(String link) async {
    if (await canLaunchUrl(Uri.parse(link))) {
      await launchUrl(Uri.parse(link));
    } else {
      throw '<h4>Não há nada para mostrar :(</h4>';
    }
  }
}
