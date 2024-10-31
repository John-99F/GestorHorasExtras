import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestor_horas_extras/core/utils/platform_utils.dart';

class CustomFields extends StatelessWidget {
  final String? hint;
  final String? pathIcon;
  final String labelText;
  final String? helperText;
  final Widget? icon;
  final Function(String value) valueFields;

  const CustomFields({
    super.key,
    required this.labelText,
    required this.valueFields,
    this.hint,
    this.pathIcon,
    this.helperText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:  PlatformUtils.isAndroid() ? 15.w : 480.w),
      child: TextField(
        onChanged: (value) => valueFields(value),
        decoration: InputDecoration(
          prefixIcon: icon ?? const SizedBox(),
          hintText: hint ?? '',
          labelText: labelText,
          filled: true,
          helperText: helperText ?? '',
        ),
        style: TextStyle(fontSize: PlatformUtils.isAndroid()  ? 8.sp : 30.sp),
      ),
    );
  }
}
