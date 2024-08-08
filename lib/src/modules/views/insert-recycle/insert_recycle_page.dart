// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_recycling/src/shared/models/recycle_model.dart';
import '../../../shared/themes/themes.dart';
import '../../../shared/widgets/widgets.dart';
import 'insert_recycle_controller.dart';

class InsertRecyclePage extends StatefulWidget {
  const InsertRecyclePage({super.key});

  @override
  State<InsertRecyclePage> createState() => _InsertRecyclePageState();
}

class _InsertRecyclePageState extends State<InsertRecyclePage> {
  final InsertRecycleController insertRecycleController =
      InsertRecycleController();

// temp data for test's
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Selecione"), value: ""),
      DropdownMenuItem(child: Text("Reciclar"), value: "recycle"),
      DropdownMenuItem(child: Text("Criar"), value: "create"),
      DropdownMenuItem(child: Text("Descartar"), value: "drop"),
    ];
    return menuItems;
  }

  String _selectedValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(),
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
                              value: _selectedValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedValue = newValue!;
                                });
                              },
                              items: dropdownItems),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: recycleModel.isLoading
                          ? const CircularProgressIndicator()
                          : Text(recycleModel.address ??
                              "Nenhum local carregado!"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AppButtom(
                        width: double.infinity,
                        textoButtom: 'Obter a minha localição aproximada',
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
          function: () {},
        ),
      ),
    );
  }
}
