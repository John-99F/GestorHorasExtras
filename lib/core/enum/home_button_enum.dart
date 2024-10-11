import 'package:gestor_horas_extras/core/enum/profile_enum.dart';
import 'package:gestor_horas_extras/core/utils/constants.dart';

enum HomeButtonEnum {
  report(
    title: Constants.reportTitle,
    pathImage: "assets/images/icon_reportes.png",
    userActive: [ProfileEnum.admin, ProfileEnum.dev, ProfileEnum.supervisor],
  ),
  statistics(
    title: Constants.statisticsTitle,
    pathImage: "assets/images/icon_estadisticas.png",
    userActive: [ProfileEnum.admin, ProfileEnum.dev, ProfileEnum.supervisor],
  ),
  support(
    title: Constants.supportTitle,
    pathImage: "assets/images/icon_soporte.png",
    userActive: [ProfileEnum.admin, ProfileEnum.dev, ProfileEnum.supervisor],
  );

  final String title;
  final String pathImage;
  final List<ProfileEnum> userActive;

  const HomeButtonEnum({
    required this.title,
    required this.pathImage,
    required this.userActive,
  });
}
