
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rules_provider.g.dart';

                              
@riverpod
class Responsible extends _$Responsible{
  @override
  String build() => '';
  
  void setResponsible(String value){ 
      state = value;
  }
}

@riverpod
class ImmediateBoss extends _$ImmediateBoss{
  @override
  String build() => '';
  
  void setImmediateBoss(String value){ 
      state = value;
  }
}


@riverpod
class Project extends _$Project{
  @override
  String build() => '';
  
  void setProject(String value){ 
      state = value;
  }
}

@riverpod
class Description extends _$Description{
  @override
  String build() => '';
  
  void setDescription(String value){ 
      state = value;
  }
}
