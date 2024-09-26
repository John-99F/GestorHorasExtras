import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestor_horas_extras/app/main_app.dart';
import 'package:gestor_horas_extras/core/utils/platform_utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); 

  runApp(
    ScreenUtilInit(
      designSize: PlatformUtils.isAndroid() ? const Size(161, 74) : const Size(1920, 1080),
      builder: (context, child) {
        return const ProviderScope(
          child: MainApp(),
        );
      },
    ),
  );
}
