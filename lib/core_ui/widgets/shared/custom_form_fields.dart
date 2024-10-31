import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestor_horas_extras/core/utils/constants.dart';

class CustomFormFields extends StatelessWidget {
  final VoidCallback actionFields;
  final String labelText;
  final String? emailErrorMessage;
  final Function(String value) onChanged;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final int maxLines;
  final String initValue;

  const CustomFormFields({
    super.key,
    required this.actionFields,
    required this.labelText,
    this.emailErrorMessage,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.maxLines = 1,
    required this.onChanged,
    this.initValue = Constants.emptyValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 300.0),
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.blueAccent,
          ),
        ),
        const SizedBox(width: 10.0),
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
                 color: Colors.white,
          ),
          width: 800.w,
          child: TextFormField(
            cursorColor: Colors.blueAccent,
            maxLines: maxLines,
            initialValue: initValue,
            decoration: InputDecoration(
               fillColor: Colors.blueAccent,
               focusColor: Colors.blueAccent,
               hoverColor: Colors.blueAccent,
              errorText: emailErrorMessage,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
            onChanged: (String value) {
              onChanged(value);
            },
            obscureText: obscureText,
            enableSuggestions: enableSuggestions,
            autocorrect: autocorrect,
          ),
        ),
      ],
    );
  }
}
