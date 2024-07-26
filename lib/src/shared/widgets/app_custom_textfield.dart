// import 'package:comunica_ti/shared/themes/themes.dart';
import 'package:flutter/material.dart';

import '../themes/app_textstyles.dart';

class AppCustomTextField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? textEditingController;
  final TextInputType type;
  final bool oculto;
  final Function? validator;
  final String? validatorText;

  const AppCustomTextField(
      {Key? key,
      this.title = '',
      required this.hint,
      this.textEditingController,
      required this.type,
      this.oculto = false,
      this.validator,
      this.validatorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != ''
            ? Text(
                title,
                style: AppTextStyles.txtTextForm,
              )
            : Container(),
        // SizedBox(height: 5),
        TextFormField(
          keyboardType: type,
          obscureText: oculto,
          decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(),
            hintStyle: AppTextStyles.txtTextFormHint,
          ),
          controller: textEditingController,
          validator: (validator) {
            if (validator == null || validator.isEmpty) {
              return validatorText;
            }
            return null;
          },
        ),
      ],
    );
  }
}
