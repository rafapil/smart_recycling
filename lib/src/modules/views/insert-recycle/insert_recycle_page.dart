import 'package:flutter/material.dart';
import '../../../shared/themes/themes.dart';
import '../../../shared/widgets/widgets.dart';

class InsertRecyclePage extends StatefulWidget {
  const InsertRecyclePage({super.key});

  @override
  State<InsertRecyclePage> createState() => _InsertRecyclePageState();
}

class _InsertRecyclePageState extends State<InsertRecyclePage> {
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
  String _valueGeo = "847474847 849484949";
  bool _resultGeo = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(),
      body: Padding(
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
                AppPickPhoto(),
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
                          hint: const Text('Selecione o que gostaria de fazer'),
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
                  child: _resultGeo ? Text(_valueGeo) : Container(),
                  // precisa ver a questão de reatividade para atualizar esse carinha
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
                    function: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
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
