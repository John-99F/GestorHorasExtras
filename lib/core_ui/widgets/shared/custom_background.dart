import 'package:flutter/material.dart';
import 'package:gestor_horas_extras/core_ui/images/images_constants.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagesConstants.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
