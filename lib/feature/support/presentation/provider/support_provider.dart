import 'package:gestor_horas_extras/core/enum/help_steps_enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'support_provider.g.dart';


@riverpod
class SelectedStepHelp extends _$SelectedStepHelp {
  @override
  HelpStepsEnum build() => HelpStepsEnum.stepComplete;

  void setHelpStep(HelpStepsEnum helpEnum) {
    state =  helpEnum;
  }
}