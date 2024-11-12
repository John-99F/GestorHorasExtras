
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestor_horas_extras/app/main_app.dart';
import 'package:gestor_horas_extras/core/utils/platform_utils.dart';
import 'package:gestor_horas_extras/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
