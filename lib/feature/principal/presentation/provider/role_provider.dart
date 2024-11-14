
import 'package:gestor_horas_extras/core/enum/home_button_enum.dart';
import 'package:gestor_horas_extras/core/utils/preferences_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'role_provider.g.dart';

final PreferencesUtils _preferencesUtils = PreferencesUtils.instance;


@riverpod
Future<String> getRole(GetRoleRef ref) async {
  return await _preferencesUtils.getRoleUser();
}