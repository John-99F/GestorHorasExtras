import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestor_horas_extras/core/enum/home_button_enum.dart';
import 'package:gestor_horas_extras/core/utils/excel_utils.dart';
import 'package:gestor_horas_extras/core/utils/firestore_utils.dart';
import 'package:gestor_horas_extras/core/utils/platform_utils.dart';
import 'package:gestor_horas_extras/core/utils/preferences_utils.dart';
import 'package:gestor_horas_extras/core_ui/widgets/shared/custom_app_bar.dart';
import 'package:gestor_horas_extras/core_ui/widgets/shared/widgets.dart';
import 'package:gestor_horas_extras/feature/auth/login/presentation/screen/login_screen.dart';
import 'package:gestor_horas_extras/feature/principal/presentation/provider/get_all_report_users_provider.dart';
import 'package:gestor_horas_extras/feature/principal/presentation/provider/role_provider.dart';
import 'package:gestor_horas_extras/feature/statistics/presentation/provider/get_all_report_provider.dart';
import 'package:gestor_horas_extras/navigation/navigations_routers_provider.dart';

class HomeScreen extends ConsumerWidget {
  static const String name = "HomeScreen";
  static const String link = "/$name";
  final PreferencesUtils _preferencesUtils = PreferencesUtils.instance;

  HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rolUser = ref.watch(getRoleProvider);
    return rolUser.when(
      data: (data) => Scaffold(
        // Extender el cuerpo detrás de la AppBar
        body: SafeArea(
          child: Stack(
            children: [
              const CustomBackground(),
              Center(
                child: _buildBody(ref, data),
              ),
            ],
          ),
        ),
      ),
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }

  _buildBody(WidgetRef ref, String role) {
    final navigation = ref.watch(navigationRoutersProvider);
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(
            actionFunction: () {
              navigation.pushReplacement(LoginScreen.link);
            },
          ),
          SizedBox(height: PlatformUtils.isAndroid() ? 1.h : 35.h),
          _buildMainMenu(ref, role),
        ],
      ),
    );
  }

  _buildMainMenu(WidgetRef ref, String role) {
    final navigation = ref.watch(navigationRoutersProvider);
    final getAllReport = ref.watch(getAllReportUsersProvider);
    FirestoreUtils.getRule();
    return getAllReport.when(
      data: (getAllReport) {
        return Center(
          child: SizedBox(
            height: PlatformUtils.isAndroid() ? 65.h : 900.h,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 5.w),
              scrollDirection:
                  PlatformUtils.isAndroid() ? Axis.vertical : Axis.horizontal,
              itemCount: HomeButtonEnum.values.length,
              itemBuilder: (context, index) {
                final homeEnum = HomeButtonEnum.values.elementAt(index);
                return validateActiveButton(role, homeEnum)
                    ? CustomCardButton(
                        homeButtonEnum: homeEnum,
                        onTap: () async {
                          Map<String, String> users = await FirestoreUtils.getAllUsers();
                          if (homeEnum != HomeButtonEnum.generateAllReport) {
                            navigation.pushReplacement(HomeButtonEnum.values
                                .elementAt(index)
                                .linkNavigation);
                          } else {
                            ExcelUtils.createExcelAllReport(
                                getAllReport,
                                users,
                                await _preferencesUtils.getProject(),
                                await _preferencesUtils.getResponsible(),
                                await _preferencesUtils.getImmediateBoss());
                          }
                        },
                      )
                    : const SizedBox();
              },
            ),
          ),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }

  bool validateActiveButton(String id, HomeButtonEnum homeButtonEnum) {
    return homeButtonEnum.userActive.contains(int.parse(id));
  }
}
