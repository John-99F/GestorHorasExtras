import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gestor_horas_extras/core/utils/platform_utils.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final Color colorTextButton;
  final Color backgroundColor;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.buttonName,
    required this.colorTextButton,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
        elevation: const WidgetStatePropertyAll(2),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1),
          ),
        ),
      ),
      child: SizedBox(
        width: PlatformUtils.isAndroid()  ? 100.w : 150.w,
        height: PlatformUtils.isAndroid()  ? 5.h : 80.h,
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(
              color: colorTextButton,
              fontSize: PlatformUtils.isAndroid()  ? 8.sp : 25.sp,
            ),
          ),
        ),
      ),
      onPressed: () => onTap.call(),
    );
  }
}
