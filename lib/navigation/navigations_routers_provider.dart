import 'package:gestor_horas_extras/feature/auth/login/presentation/screen/login_screen.dart';
import 'package:gestor_horas_extras/navigation/nav_keys.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigations_routers_provider.g.dart';

@riverpod
GoRouter navigationRouters(NavigationRoutersRef ref) {
  return GoRouter(
    initialLocation: LoginScreen.link,
    navigatorKey: NavKeys.rootNavKey,
    routes: [
      /// Navigation to Login
      GoRoute(
        path: LoginScreen.link,
        name: LoginScreen.name,
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
}