import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestor_horas_extras/core/enum/home_button_enum.dart';
import 'package:gestor_horas_extras/core/utils/platform_utils.dart';
import 'package:gestor_horas_extras/core_ui/colors/color_constants.dart';
import 'package:gestor_horas_extras/core_ui/images/images_constants.dart';

class CustomCardButton extends StatelessWidget {
  final HomeButtonEnum homeButtonEnum;
  final VoidCallback? onTap;

  const CustomCardButton({
    super.key,
    required this.homeButtonEnum,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(PlatformUtils.isAndroid() ? 10 : 50,),
      child: Column(
        children: [
          _buildCard(),
          _buildTitle(),
        ],
      ),
    );
  }

  _buildCard() {
    return GestureDetector(
      onTap: () => onTap!.call(),
      child: Container(
        decoration:  BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(ImagesConstants.backgroundImage),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image.asset(
          homeButtonEnum.pathImage,
          width: PlatformUtils.isAndroid() ? 80.w : 500.w,
          height: PlatformUtils.isAndroid() ? 20.h : 500.h,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  _buildTitle() {
    return Text(
      homeButtonEnum.title,
      style: const TextStyle(
          color: Color(ColorConstants.subTextColor),
          fontSize: 25,
          fontStyle: FontStyle.italic),
    );
  }
}
