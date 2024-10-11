import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestor_horas_extras/core/enum/home_button_enum.dart';
import 'package:gestor_horas_extras/core/utils/platform_utils.dart';
import 'package:gestor_horas_extras/core_ui/widgets/shared/custom_app_bar.dart';
import 'package:gestor_horas_extras/core_ui/widgets/shared/widgets.dart';

class HomeScreen extends ConsumerWidget {
  static const String name = "HomeScreen";
  static const String link = "/$name";

  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // Extender el cuerpo detrás de la AppBar
      body: SafeArea(
        child: Stack(
          children: [
            const CustomBackground(),
            Center(
              child: _buildBody(),
            ),
          ],
        ),
      ),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomAppBar(),
           SizedBox(height: PlatformUtils.isAndroid() ? 1.h : 35.h),
          _buildMainMenu(),
        ],
      ),
    );
  }

  _buildMainMenu() {
    return Center(
      child: SizedBox(
        height: PlatformUtils.isAndroid() ? 65.h : 900.h,
        child: ListView.builder(
          padding: EdgeInsets.only(left: 2.w),
          scrollDirection:PlatformUtils.isAndroid() ? Axis.vertical :  Axis.horizontal,
          itemCount: HomeButtonEnum.values.length,
          itemBuilder: (context, index) {
            return CustomCardButton(
              homeButtonEnum: HomeButtonEnum.values.elementAt(index),
              onTap: () {
                print(
                    "On Tap in button: ${HomeButtonEnum.values.elementAt(index)}");
              },
            );
          },
        ),
      ),
    );
  }
}
