import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestor_horas_extras/core/utils/firestore_utils.dart';
import 'package:gestor_horas_extras/core/utils/platform_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestor_horas_extras/core_ui/colors/color_constants.dart';
import 'package:gestor_horas_extras/core_ui/widgets/shared/widgets.dart';
import 'package:gestor_horas_extras/feature/auth/login/presentation/provider/login_provider.dart';

import 'package:gestor_horas_extras/feature/principal/presentation/screen/home_screen.dart';
import 'package:gestor_horas_extras/navigation/navigations_routers_provider.dart';

class LoginScreen extends ConsumerWidget {
  static const String name = 'LoginScreen';
  static const String link = '/$name';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const CustomBackground(),
            Center(
              child: _buildBody(ref),
            ),
          ],
        ),
      ),
    );
  }

  _buildBody(WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildLogo(),
          SizedBox(height: PlatformUtils.isAndroid() ? 0 : 15.h),
          _buildFormLogin(ref),
          _buildOptionPassword(),
          SizedBox(height: PlatformUtils.isAndroid() ? 10.h : 80.h),
          _buildButtonLogin(ref),
        ],
      ),
    );
  }

  _buildLogo() {
    return Image.asset(
      "assets/images/logo.png",
      width: PlatformUtils.isAndroid() ? 100.w : 900.w,
      height: PlatformUtils.isAndroid() ? 30.h : 400.h,
    );
  }

  _buildFormLogin(WidgetRef ref) {
    return Column(
      children: [
        CustomFields(
          labelText: "UserName",
          icon: const Icon(Icons.verified_user),
          valueFields: (text) {
            ref.read(userLoginProvider.notifier).setUserLogin(text);
          },
        ),
        CustomFields(
          icon: const Icon(Icons.password),
          labelText: "Password",
          valueFields: (text) {
            ref.read(passwordLoginProvider.notifier).setPasswordLogin(text);
          },
        ),
      ],
    );
  }

  _buildOptionPassword() {
    return Row(
      children: [
        _forgotPasswordText(),
        _rememberMeText(),
      ],
    );
  }

  _forgotPasswordText() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: PlatformUtils.isAndroid() ? 15.w : 480.w),
      child: GestureDetector(
        child: Text(
          "Olvide mi contraseña",
          style: TextStyle(
              color: const Color(ColorConstants.subTextColor),
              fontSize: PlatformUtils.isAndroid() ? 6.sp : 30.sp),
        ),
      ),
    );
  }

  _rememberMeText() {
    return GestureDetector(
      child: Text(
        "Recuerdame",
        style: TextStyle(
            color: const Color(ColorConstants.subTextColor),
            fontSize: PlatformUtils.isAndroid() ? 6.sp : 30.sp),
      ),
    );
  }

  _buildButtonLogin(WidgetRef ref) {
    final navigation = ref.watch(navigationRoutersProvider);
    final userLogin = ref.watch(userLoginProvider);
    final passwordLogin = ref.watch(passwordLoginProvider);
    return CustomButton(
      buttonName: "Login",
      backgroundColor: const Color(0x001E4B74),
      colorTextButton: Colors.white,
      onTap: () async {
        if (userLogin.isNotEmpty &&
            passwordLogin.isNotEmpty &&
           await FirestoreUtils.getUser(userLogin, passwordLogin) == true) {
          navigation.pushReplacement(HomeScreen.link);
        } else {
          print("Error usuario o contraseña incorrectos");
        }
      },
    );
  }
}
