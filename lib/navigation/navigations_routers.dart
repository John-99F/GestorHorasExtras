import 'package:gestor_horas_extras/feature/auth/forgotPassword/presentation/screen/login_screen.dart';
import 'package:go_router/go_router.dart';

class NavigationsRouters {
  static final List<GoRoute> goRoutes = [
    /// Navigation to Login
    GoRoute(
      path: LoginScreen.link,
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    )
  ];
}
