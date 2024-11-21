import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestor_horas_extras/core/utils/platform_utils.dart';

class CustomFields extends StatelessWidget {
  final String? hint;
  final String? pathIcon;
  final String labelText;
  final String? helperText;
  final Widget? icon;
  final bool obscureText;
  final int maxLines;
  final Function(String value) valueFields;

  const CustomFields({
    super.key,
    required this.labelText,
    required this.valueFields,
    this.hint,
    this.pathIcon,
    this.helperText,
    this.icon,
    this.obscureText = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: PlatformUtils.isAndroid() ? 15.w : 480.w),
      child: TextField(
        maxLines: maxLines,
        onChanged: (value) => valueFields(value),
        obscureText: obscureText,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          prefixIcon: icon ?? const SizedBox(),
          hintText: hint ?? '',
          labelText: labelText,
          filled: true,
          labelStyle: const TextStyle(color: Colors.blue),
          helperText: helperText ?? '',
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
