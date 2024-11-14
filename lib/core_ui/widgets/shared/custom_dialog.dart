import 'package:flutter/material.dart';
import 'package:gestor_horas_extras/core/enum/dialog_button_enum.dart';
import 'package:gestor_horas_extras/core_ui/images/images_constants.dart';
import 'package:gestor_horas_extras/core_ui/widgets/shared/custom_button.dart';

class CustomDialog extends StatelessWidget {
  final Color colorBackground;
  final String pathIcon;
  final DialogButtonEnum activeButton;
  final String firtButtonName;
  final String secondButtonName;
  final String titleDialog;
  final String descriptionDialog;

  const CustomDialog({
    super.key,
    required this.colorBackground,
    this.pathIcon = '',
    required this.activeButton,
    this.firtButtonName = '',
    this.secondButtonName = '',
    required this.titleDialog,
    required this.descriptionDialog,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      backgroundColor: colorBackground,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
        height: 350,
        decoration: BoxDecoration(
            color: colorBackground,
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Column(
          children: <Widget>[
            _buildIcon(),
            _buildTitleAndSubtitle(),
            _validateActiveButton(context),
          ],
        ),
      );

  _buildIcon() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: colorBackground,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      child: pathIcon.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                pathIcon,
                height: 120,
                width: 100,
              ),
            )
          : const SizedBox(
              height: 80,
            ),
    );
  }

  _buildTitleAndSubtitle() {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        Text(
          titleDialog,
          style: const TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 6, left: 6),
          child: Text(
            descriptionDialog,
            style: const TextStyle(color: Colors.white, fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }

  _validateActiveButton(BuildContext context) {
    return activeButton == DialogButtonEnum.oneButton
        ? _buildButtonOne(context)
        : activeButton == DialogButtonEnum.twoButton
            ? _buildTwoButton(context)
            : const SizedBox(
                height: 20,
              );
  }

  _buildButtonOne(BuildContext context) {
    return CustomButton(
      onTap: () {
        Navigator.of(context).pop();
      },
      buttonName: firtButtonName,
      colorTextButton: Colors.white,
      backgroundColor: const Color(0x001E4B74),
    );
  }

  _buildTwoButton(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CustomButton(
          onTap: () {
            Navigator.of(context).pop();
          },
          buttonName: secondButtonName,
          colorTextButton: Colors.white,
          backgroundColor: const Color(0x001E4B74),
        ),
        const SizedBox(
          width: 8,
        ),
        CustomButton(
          onTap: () {
            Navigator.of(context).pop();
          },
          buttonName: firtButtonName,
          colorTextButton: Colors.white,
          backgroundColor: const Color(0x001E4B74),
        ),
      ],
    );
  }
}
