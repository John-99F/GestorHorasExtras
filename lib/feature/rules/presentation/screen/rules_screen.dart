import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestor_horas_extras/core/utils/firestore_utils.dart';
import 'package:gestor_horas_extras/core/utils/preferences_utils.dart';
import 'package:gestor_horas_extras/core_ui/widgets/shared/custom_form_fields.dart';
import 'package:gestor_horas_extras/core_ui/widgets/shared/widgets.dart';
import 'package:gestor_horas_extras/feature/rules/presentation/provider/rules_provider.dart';
import 'package:gestor_horas_extras/navigation/navigations_routers_provider.dart';

class RulesScreen extends ConsumerWidget {
  static const String name = "RulesScreen";
  static const String link = "/$name";

  const RulesScreen({super.key});

  static final PreferencesUtils _preferencesUtils = PreferencesUtils.instance;

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
            height: 10.h,
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
      "Crear reglas",
      style: TextStyle(fontSize: 70, color: Colors.blueAccent),
    );
  }

  _buildForm(WidgetRef ref) {
    String responsible = ref.watch(responsibleProvider);
    String immediateBoss = ref.watch(immediateBossProvider);
    String project = ref.watch(projectProvider);
    String description = ref.watch(descriptionProvider);
    return Column(
      children: [
        SizedBox(height: 20.h),
        CustomFormFields(
          actionFields: () {},
          labelText: "responsable extras:",
          onChanged: (String value) {
            ref.read(responsibleProvider.notifier).setResponsible(value);
          },
          spaceTitleField: 30.w,
        ),
        SizedBox(height: 10.h),
        CustomFormFields(
          actionFields: () {},
          labelText: "jefe inmediato:",
          onChanged: (String value) {
            ref.read(immediateBossProvider.notifier).setImmediateBoss(value);
          },
        ),
        //const CustomDropdown(),
        SizedBox(height: 10.h),
        CustomFormFields(
          actionFields: () {},
          labelText: "proyecto:",
          onChanged: (String value) {
            ref.read(projectProvider.notifier).setProject(value);
          },
        ),
        SizedBox(height: 10.h),
        CustomFormFields(
          actionFields: () {},
          labelText: "descripcion:",
          onChanged: (String value) {
            ref.read(descriptionProvider.notifier).setDescription(value);
          },
          maxLines: 5,
        ),
        SizedBox(height: 50.h),
        CustomButton(
            buttonName: "Crear reglas",
            backgroundColor: const Color(0x001E4B74),
            colorTextButton: Colors.white,
            onTap: () async {
              FirestoreUtils.createRule(
                documentNumber: await _preferencesUtils.getDocumentNumber(),
                responsable: responsible,
                jefeInmediato: immediateBoss,
                project: project,
                descripcion: description,
              );
              resetForm(ref);
            }),
        SizedBox(height: 20.h),
      ],
    );
  }

  resetForm(WidgetRef ref) {
    final navigation = ref.watch(navigationRoutersProvider);
    navigation.pushReplacement(link);
  }
}
