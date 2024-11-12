
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

                              
@riverpod
class DocumentNumber extends _$DocumentNumber{
  @override
  String build() => '';
  
  void setDocumentNumber(String value){ 
      state = value;
  }
}

@riverpod
class NameUser extends _$NameUser{
  @override
  String build() => '';
  
  void setNameUser(String value){ 
      state = value;
  }
}


@riverpod
class SecondNameUser extends _$SecondNameUser{
  @override
  String build() => '';
  
  void setSecondNameUser(String value){ 
      state = value;
  }
}

@riverpod
class RolUser extends _$RolUser{
  @override
  String build() => '';
  
  void setRolUser(String value){ 
      state = value;
  }
}

@riverpod
class PasswordUser extends _$PasswordUser{
  @override
  String build() => '';
  
  void setPasswordUser(String value){ 
      state = value;
  }
}

@riverpod
class PasswordConfirmUser extends _$PasswordConfirmUser{
  @override
  String build() => '';
  
  void setPasswordConfirmUser(String value){ 
      state = value;
  }
}