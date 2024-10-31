
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_provider.g.dart';

                              
@riverpod
class SelectedDropdownItem extends _$SelectedDropdownItem{
  @override
  String build() => '1:00';
  
  void setSelectedDropdownItem(String value){ 
      state = value;
  }
}