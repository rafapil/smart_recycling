import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:smart_recycling/src/modules/views/chat/chat_page_controller.dart';
import 'package:smart_recycling/src/shared/models/recycle_model.dart';
import 'package:lottie/lottie.dart';

import '../../../shared/themes/themes.dart';

/// Pagina que carrega a resposta obtida do Google Gemini não possui ação apenas apresenta o resultado.
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatPageController _chatPageController = ChatPageController();

  @override
  Widget build(BuildContext context) {
    final recycleModel = Provider.of<RecycleModel>(context, listen: false);
    Future<String?> result = _chatPageController.createMessageIA(
        recycleModel.address, recycleModel.selection, recycleModel.image);

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              AppImages.imageApp,
              height: 36,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Smart Recycling',
              style: AppTextStyles.txtSubTitle,
            )
          ],
        ),
        actions: [
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              recycleModel.setaddress('');
              recycleModel.setSelection('');
              Navigator.popAndPushNamed(context, '/add');
            },
          ),
        ],
      ),
      body: FutureBuilder(
          future: result,
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                return SingleChildScrollView(
                    child: Html(
                  data: snapshot.data,
                  onLinkTap: (url, _, __) {
                    if (url != null) {
                      _chatPageController.redirectURL(url);
                    }
                  },
                ));
              } else {
                return Center(
                  child: Lottie.asset('assets/lottie/error.json'),
                );
              }
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Center(
                child: Lottie.asset('assets/lottie/ai.json'),
              );
            }
          }),
    );
  }
}
