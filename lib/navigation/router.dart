import 'package:gestor_horas_extras/feature/auth/forgotPassword/presentation/screen/login_screen.dart';
import 'package:gestor_horas_extras/navigation/nav_keys.dart';
import 'package:gestor_horas_extras/navigation/navigations_routers.dart';
import 'package:go_router/go_router.dart';

class RouterNav {
    GoRouter get router => _router;

    static final GoRouter _router = GoRouter(
      initialLocation: LoginScreen.link,
      navigatorKey: NavKeys.rootNavKey,
      /// Rutas de navegacion
      routes: <RouteBase> [
        ...NavigationsRouters.goRoutes,
      ]);
}