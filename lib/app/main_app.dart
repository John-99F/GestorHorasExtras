import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestor_horas_extras/navigation/navigations_routers_provider.dart';

class MainApp extends ConsumerWidget {

  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationRouters = ref.watch(navigationRoutersProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: navigationRouters,
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
