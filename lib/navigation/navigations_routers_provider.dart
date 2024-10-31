import 'package:gestor_horas_extras/feature/auth/login/presentation/screen/login_screen.dart';
import 'package:gestor_horas_extras/feature/principal/presentation/screen/home_screen.dart';
import 'package:gestor_horas_extras/feature/report/presentation/screen/report_screen.dart';
import 'package:gestor_horas_extras/feature/statistics/presentation/screen/statistics_screen.dart';
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
      GoRoute(
        path: HomeScreen.link,
        name: HomeScreen.name,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: ReportScreen.link,
        name: ReportScreen.name,
        builder: (context, state) => const ReportScreen(),
      ),
        GoRoute(
        path: StatisticsScreen.link,
        name: StatisticsScreen.name,
        builder: (context, state) => const StatisticsScreen(),
      ),

    ],
  );
}
