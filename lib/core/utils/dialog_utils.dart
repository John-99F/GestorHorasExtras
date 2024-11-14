import 'package:flutter/material.dart';
import 'package:gestor_horas_extras/core/enum/dialog_button_enum.dart';
import 'package:gestor_horas_extras/core_ui/widgets/shared/custom_dialog.dart';

class DialogUtils {
  static confirmOrErrorDialog(
      BuildContext context,
      DialogButtonEnum dialogButtonEnum,
      Color colorBackground,
      String title,
      String description,
      {String firstButtonName = '',
      String secondButtonName = ''}) {
    showDialog(
      context: context,
      builder: (context) => CustomDialog(
        colorBackground: colorBackground,
        activeButton: dialogButtonEnum,
        titleDialog: title,
        descriptionDialog: description,
        firtButtonName: firstButtonName,
        secondButtonName: secondButtonName,
      ),
    );
  }

  static confirmRegisterDialog(BuildContext context, String description) {
    DialogUtils.confirmOrErrorDialog(
      context,
      DialogButtonEnum.withoutButton,
      Colors.green,
      "Excelente !!!!",
      "$description creado exitosamente",
    );
  }

  static errorRegisterDialog(BuildContext context, String description) {
    DialogUtils.confirmOrErrorDialog(
                  context,
                  DialogButtonEnum.oneButton,
                  Colors.red,
                  "Error al registrar $description!!",
                  "Por favor verificar los campos del formuario",
                  firstButtonName: "Aceptar",
                );
  }
}
