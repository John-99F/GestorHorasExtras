import 'package:gestor_horas_extras/core_ui/images/images_constants.dart';

enum HelpStepsEnum {
  stepReport(
    description: "Ahora tus reportes, mas cerca de ti, si tienes.",
    pathImage: ImagesConstants.stadisticIcon,
  ),
  stepStadistics(
    description: "Ahora puedes reportar tus horas extras llendo en el menu principal em reportes.",
    pathImage: ImagesConstants.supportIcon,
  ),
  stepComplete(
    description: "Tambien pues mirar las diferentes estadisticas de los reportes mensuales",
    pathImage: ImagesConstants.reportIcon,
  );

  final String description;
  final String pathImage;

  const HelpStepsEnum({
    required this.description,
    required this.pathImage,
  });
}
