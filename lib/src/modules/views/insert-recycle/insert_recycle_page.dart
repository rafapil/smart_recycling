import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_recycling/src/shared/models/recycle_model.dart';
import '../../../shared/themes/themes.dart';
import '../../../shared/widgets/widgets.dart';
import 'insert_recycle_controller.dart';

/// Pagina para inserir a imagem do item que deseja reciclar e definir suas opções de pesquisa no Google Gemini
class InsertRecyclePage extends StatefulWidget {
  const InsertRecyclePage({super.key});

  @override
  State<InsertRecyclePage> createState() => _InsertRecyclePageState();
}

class _InsertRecyclePageState extends State<InsertRecyclePage> {
  final InsertRecycleController insertRecycleController =
      InsertRecycleController();

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: '', child: Text('Selecione')),
      const DropdownMenuItem(value: 'reciclar', child: Text('Reciclar')),
      const DropdownMenuItem(value: 'criar', child: Text('Criar')),
      const DropdownMenuItem(value: 'descartar', child: Text('Descartar')),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Consumer<RecycleModel>(
        builder: (_, recycleModel, __) {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: Text(
                        'Adicionar material que deseja reciclar',
                        style: AppTextStyles.txtSubTitleBlack,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final recycleModel =
                            Provider.of<RecycleModel>(context, listen: false);
                        await recycleModel.getImage();
                      },
                      child: recycleModel.image == null
                          ? const AppPickPhoto()
                          : AppPickPhoto(
                              isImage: true,
                              image: recycleModel.image,
                            ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'O que gostaria de fazer com o material?',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DropdownButtonFormField(
                              style: AppTextStyles.txtTextFormWhite,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.borderGrey, width: 0.5),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.borderGrey, width: 0.5),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                filled: true,
                                fillColor: AppColors.lightGreen,
                              ),
                              hint: const Text(
                                  'Selecione o que gostaria de fazer'),
                              disabledHint: const Text(
                                  'Selecione o que quer fazer com o material'),
                              dropdownColor: AppColors.lightGreen,
                              value: recycleModel.selection,
                              onChanged: (newValue) {
                                recycleModel.setSelection(newValue!);
                              },
                              items: dropdownItems),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: recycleModel.isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                    AppColors.strongGreen),
                                strokeWidth: 3.0,
                              ),
                            )
                          : Text(recycleModel.address ??
                              'Nenhum local carregado!'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AppButtom(
                        width: double.infinity,
                        textoButtom: 'Obter localição aproximada',
                        buttomStyle: AppTextStyles.txtButtomWhite,
                        color: AppColors.lightGreen,
                        function: () async {
                          recycleModel.setLoading(true);
                          String address =
                              await insertRecycleController.getUserLocation();
                          recycleModel.setaddress(address);
                          recycleModel.setLoading(false);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
        child: AppButtom(
          width: double.infinity,
          textoButtom: 'Obter informações',
          buttomStyle: AppTextStyles.txtButtomWhite,
          color: AppColors.orange,
          function: () async {
            final recycleModel =
                Provider.of<RecycleModel>(context, listen: false);
            if (insertRecycleController.validateInfo(recycleModel.image,
                recycleModel.selection, recycleModel.address)) {
              Navigator.popAndPushNamed(context, '/chat');
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  action: SnackBarAction(
                    textColor: AppColors.orange,
                    label: 'Close',
                    onPressed:
                        ScaffoldMessenger.of(context).hideCurrentSnackBar,
                  ),
                  content: const Text('Insira todas as informações!'),
                  duration: const Duration(milliseconds: 3000),
                  width: 320.0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 8.0,
                  ),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
