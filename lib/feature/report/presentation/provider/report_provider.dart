
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

@riverpod
class SetDate extends _$SetDate{
  @override
  String build() => DateTime.now().toString();
  
  void setDate(String value){ 
      state = value;
  }
}

@riverpod
class SetInitHours extends _$SetInitHours{
  @override
  String build() => "";
  
  void setInitHours(String value){ 
      state = value;
  }
}

@riverpod
class SetLastHours extends _$SetLastHours{
  @override
  String build() => "";
  
  void setLastHours(String value){ 
      state = value;
  }
}

@riverpod
class SetDescription extends _$SetDescription{
  @override
  String build() => "";
  
  void setDescription(String value){ 
      state = value;
  }
}