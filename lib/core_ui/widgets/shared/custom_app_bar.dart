import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestor_horas_extras/core_ui/images/images_constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1700.w,
      height: 50,
      child: _buildBodyAppBar(),
    );
  }

  _buildBodyAppBar() {
    return Container(
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            ImagesConstants.logoutIcon,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
