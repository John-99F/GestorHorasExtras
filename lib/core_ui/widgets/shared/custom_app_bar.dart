import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestor_horas_extras/core_ui/images/images_constants.dart';

class CustomAppBar extends StatelessWidget { 
  final VoidCallback actionFunction;

  const CustomAppBar({super.key, required this.actionFunction});

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
          GestureDetector(
            child: Image.asset(
            ImagesConstants.logoutIcon,
            color: Colors.white,
          ),
          onTap: () {
            actionFunction.call();
          },
          )
          
        ],
      ),
    );
  }
}
