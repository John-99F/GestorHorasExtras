import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

                              
@riverpod
class UserLogin extends _$UserLogin{
  @override
  String build() => '';
  
  void setUserLogin(String value){ 
      state = value;
  }
}

@riverpod
class PasswordLogin extends _$PasswordLogin{
  @override
  String build() => '';
  
  void setPasswordLogin(String value){ 
      state = value;
  }
}