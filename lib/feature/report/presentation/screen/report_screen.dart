import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestor_horas_extras/core/enum/dialog_button_enum.dart';
import 'package:gestor_horas_extras/core/utils/dialog_utils.dart';
import 'package:gestor_horas_extras/core/utils/firestore_utils.dart';
import 'package:gestor_horas_extras/core/utils/preferences_utils.dart';
import 'package:gestor_horas_extras/core_ui/widgets/shared/widgets.dart';
import 'package:gestor_horas_extras/feature/report/presentation/provider/report_provider.dart';
import 'package:gestor_horas_extras/navigation/navigations_routers_provider.dart';

class ReportScreen extends ConsumerWidget {
  static const String name = "ReportScreen";
  static const String link = "/$name";
  static final PreferencesUtils _preferencesUtils = PreferencesUtils.instance;

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
              child: _buildBody(ref),
            ),
          ],
        ),
      ),
    );
  }

  _buildBody(WidgetRef ref) {
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
          _buildForm(ref),
        ],
      ),
    );
  }

  _buildTitle() {
    return const Text(
      "Reporte de extras",
      style: TextStyle(fontSize: 70, color: Colors.blueAccent),
    );
  }

  _buildForm(WidgetRef ref) {
    String fecha = ref.watch(setDateProvider);
    String horaInicio = ref.watch(setInitHoursProvider);
    String horaFinal = ref.watch(setLastHoursProvider);
    String descripcion = ref.watch(setDescriptionProvider);
    return Column(
      children: [
        SizedBox(height: 20.h),
        CustomFields(
          labelText: "Fecha:",
          valueFields: (String value) {
            ref.read(setDateProvider.notifier).setDate(value);
          },
        ),
        SizedBox(height: 10.h),
        CustomFields(
          labelText: "Hora inicial:",
          valueFields: (String value) {
            ref.read(setInitHoursProvider.notifier).setInitHours(value);
          },
        ),
        //const CustomDropdown(),
        SizedBox(height: 10.h),
        CustomFields(
          labelText: "Hora Final:",
          valueFields: (String value) {
            ref.read(setLastHoursProvider.notifier).setLastHours(value);
          },
        ),
        SizedBox(height: 10.h),
        CustomFields(
          labelText: "Descripcion:",
          valueFields: (String value) {
            ref.read(setDescriptionProvider.notifier).setDescription(value);
          },
          maxLines: 5,
        ),
        SizedBox(height: 50.h),
        CustomButton(
            buttonName: "Reportar",
            backgroundColor: const Color(0x001E4B74),
            colorTextButton: Colors.white,
            onTap: () async {
              if (fecha.isNotEmpty &&
                  horaInicio.isNotEmpty &&
                  horaFinal.isNotEmpty) {
                FirestoreUtils.createReport(
                  documentNumber: await _preferencesUtils.getDocumentNumber(),
                  dia: fecha,
                  horaInicio: horaInicio,
                  horaFinal: horaFinal,
                  descripcion: descripcion,
                  jefeInmediato: await _preferencesUtils.getImmediateBoss(),
                  responsable: await _preferencesUtils.getResponsible(),
                  proyecto: await _preferencesUtils.getProject(),
                );
                DialogUtils.confirmRegisterDialog(ref.context, "Reporte");
                Future.delayed(const Duration(seconds: 1), () {
                  resetForm(ref);
                });
              } else {
                DialogUtils.errorRegisterDialog(ref.context, "Reporte");
              }
            }),
        SizedBox(height: 20.h),
      ],
    );
  }

  resetForm(WidgetRef ref) {
    final navigation = ref.watch(navigationRoutersProvider);
    ref.read(setDateProvider.notifier).setDate('');
    ref.read(setInitHoursProvider.notifier).setInitHours('');
    ref.read(setLastHoursProvider.notifier).setLastHours('');
    ref.read(setDescriptionProvider.notifier).setDescription('');

    navigation.pushReplacement(link);
  }
}
