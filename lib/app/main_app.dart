import 'package:flutter/material.dart';

import '../navigation/router.dart';

class MainApp extends StatefulWidget {
  const MainApp({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: RouterNav().router,
      builder: (context, child) {
        child = MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child ?? const SizedBox(),
        );
        return child;
      },
    );
  }
}
