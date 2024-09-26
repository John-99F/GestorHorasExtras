

import 'package:flutter/material.dart';
import 'package:gestor_horas_extras/core/utils/platform_utils.dart';
import 'package:gestor_horas_extras/core_ui/widgets/custom_button.dart';
import 'package:gestor_horas_extras/core_ui/widgets/custom_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginScreen extends StatelessWidget {
  static const String name = 'LoginScreen';
  static const String link = '/$name';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg" ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
          _buildLogo(),
          SizedBox(height: PlatformUtils.isAndroid() ? 0 : 15.h),
          _buildFormLogin(),
          _buildOptionPassword(),
          SizedBox(height: PlatformUtils.isAndroid()  ? 10.h : 80.h),
          _buildButtonLogin(),
        ],
      ),
    );
  }

  _buildLogo() {
    return Image.asset(
      "assets/images/logo.png" ,
      width: PlatformUtils.isAndroid()  ? 100.w : 900.w,
      height: PlatformUtils.isAndroid()  ? 30.h : 400.h,
    );
  }

  _buildFormLogin() {
    return Column(
      children: [
        CustomFields(
          labelText: "UserName",
          icon: const Icon(Icons.verified_user),
          valueFields: (text) {
            print("User Fields: $text");
          },
        ),
        CustomFields(
          icon: const Icon(Icons.password),
          labelText: "Password",
          valueFields: (text) {
            print("Password: $text");
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
      margin: EdgeInsets.symmetric(horizontal:  PlatformUtils.isAndroid()  ? 15.w : 480.w),
      child: GestureDetector(
        child: Text(
          "Olvide mi contraseña",
          style: TextStyle(
            color:const Color(0xFF1E4B74),
            fontSize: PlatformUtils.isAndroid()  ? 6.sp : 30.sp
          ),
        ),
      ),
    );
  }

  _rememberMeText() {
    return GestureDetector(
      child: Text(
        "Recuerdame",
        style: TextStyle(
          color:const Color(0xFF1E4B74),
           fontSize: PlatformUtils.isAndroid()  ? 6.sp : 30.sp
        ),
      ),
    );
  }

  _buildButtonLogin() {
    return CustomButton(
      buttonName: "Login",
      backgroundColor: const Color(0x001E4B74),
      colorTextButton: Colors.white,
      onTap: () {
        print("OnTap...");
      },
    );
  }
}
