import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestor_horas_extras/core/enum/dialog_button_enum.dart';
import 'package:gestor_horas_extras/core/utils/dialog_utils.dart';
import 'package:gestor_horas_extras/core/utils/firestore_utils.dart';
import 'package:gestor_horas_extras/core/utils/preferences_utils.dart';
import 'package:gestor_horas_extras/core_ui/widgets/shared/custom_form_fields.dart';
import 'package:gestor_horas_extras/core_ui/widgets/shared/widgets.dart';
import 'package:gestor_horas_extras/feature/users/presentation/provider/user_provider.dart';
import 'package:gestor_horas_extras/navigation/navigations_routers_provider.dart';

class UserScreen extends ConsumerWidget {
  static const String name = "UserScreen";
  static const String link = "/$name";

  const UserScreen({super.key});

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
      "Crear usuarios",
      style: TextStyle(fontSize: 70, color: Colors.blueAccent),
    );
  }

  _buildForm(WidgetRef ref) {
    String name = ref.watch(nameUserProvider);
    String secondName = ref.watch(secondNameUserProvider);
    String rol = ref.watch(rolUserProvider);
    String documentNumber = ref.watch(documentNumberProvider);
    String password = ref.watch(passwordUserProvider);
    String confirmPassword = ref.watch(passwordConfirmUserProvider);
    return Column(
      children: [
        SizedBox(height: 20.h),
        CustomFields(
          labelText: "\t\tCedula:",
          valueFields: (String value) {
            ref.read(documentNumberProvider.notifier).setDocumentNumber(value);
          },
        ),
        SizedBox(height: 10.h),
        CustomFields(
          labelText: "Nombre:",
          valueFields: (String value) {
            ref.read(nameUserProvider.notifier).setNameUser(value);
          },
        ),
        //const CustomDropdown(),
        SizedBox(height: 10.h),
        CustomFields(
          labelText: "Apellido:",
          valueFields: (String value) {
            ref.read(secondNameUserProvider.notifier).setSecondNameUser(value);
          },
        ),
        SizedBox(height: 10.h),
        CustomFields(
          labelText: "Contraseña:",
          valueFields: (String value) {
            ref.read(passwordUserProvider.notifier).setPasswordUser(value);
          },
        ),
        SizedBox(height: 10.h),
        CustomFields(
          labelText: "Confirmar contraseña:",
          valueFields: (String value) {
            ref
                .read(passwordConfirmUserProvider.notifier)
                .setPasswordConfirmUser(value);
          },
        ),
        SizedBox(height: 10.h),
        CustomFields(
          labelText: "Rol:",
          valueFields: (String value) {
            ref.read(rolUserProvider.notifier).setRolUser(value);
          },
        ),
        SizedBox(height: 50.h),
        CustomButton(
            buttonName: "Crear",
            backgroundColor: const Color(0x001E4B74),
            colorTextButton: Colors.white,
            onTap: () async {
              if (name.isNotEmpty &&
                  secondName.isNotEmpty &&
                  documentNumber.isNotEmpty &&
                  password.isNotEmpty &&
                  confirmPassword.isNotEmpty &&
                  password == confirmPassword) {
                FirestoreUtils.createUser(
                    documentNumber: documentNumber,
                    name: name,
                    secondName: secondName,
                    rol: rol,
                    password: password);
                DialogUtils.confirmRegisterDialog(ref.context, "Usuario");
                Future.delayed(const Duration(seconds: 1), () {
                  resetForm(ref);
                });
              } else {
                DialogUtils.errorRegisterDialog(ref.context, "Usuario");
              }
            }),
        SizedBox(height: 20.h),
      ],
    );
  }

  resetForm(WidgetRef ref) {
    final navigation = ref.watch(navigationRoutersProvider);
    ref.read(documentNumberProvider.notifier).setDocumentNumber('');
    ref.read(nameUserProvider.notifier).setNameUser('');
    ref.read(secondNameUserProvider.notifier).setSecondNameUser('');
    ref.read(passwordUserProvider.notifier).setPasswordUser('');
    ref.read(passwordConfirmUserProvider.notifier).setPasswordConfirmUser('');
    ref.read(rolUserProvider.notifier).setRolUser('');
    navigation.pushReplacement(link);
  }
}
