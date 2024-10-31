import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestor_horas_extras/core_ui/widgets/shared/custom_form_fields.dart';
import 'package:gestor_horas_extras/core_ui/widgets/shared/widgets.dart';

class ReportScreen extends ConsumerWidget {
  static const String name = "ReportScreen";
  static const String link = "/$name";

  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // Extender el cuerpo detrás de la AppBar
      body: SafeArea(
        child: Stack(
          children: [
            const CustomBackground(),
            Center(
              child: _buildBody(),
            ),
          ],
        ),
      ),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 25.h,
          ),
          _buildTitle(),
          SizedBox(
            height: 30.h,
          ),
          _buildForm(),
        ],
      ),
    );
  }

  _buildTitle() {
    return const Text(
      "Reporte de extras",
      style: TextStyle(fontSize: 90, color: Colors.blueAccent),
    );
  }

  _buildForm() {
    return Column(
      children: [
        SizedBox(height: 20.h),
        CustomFormFields(
          actionFields: () {},
          labelText: "Fecha:           ",
          onChanged: (String value) {},
          initValue: "____ /____ /___",
        ),
        SizedBox(height: 10.h),
        CustomFormFields(
          actionFields: () {},
          labelText: "Hora inicial:  ",
          onChanged: (String value) {},
        ),
        //const CustomDropdown(),
        SizedBox(height: 10.h),
        CustomFormFields(
          actionFields: () {},
          labelText: "Hora Final:    ",
          onChanged: (String value) {},
        ),
        SizedBox(height: 10.h),
        CustomFormFields(
          actionFields: () {},
          labelText: "Descripcion: ",
          onChanged: (String value) {},
          maxLines: 5,
        ),
        SizedBox(height: 50.h),
        CustomButton(
            buttonName: "Reportar",
            backgroundColor: const Color(0x001E4B74),
            colorTextButton: Colors.white,
            onTap: () {}),
        SizedBox(height: 20.h),
      ],
    );
  }
}
