// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userLoginHash() => r'20798a459e1ba8355a1320a37aff453d5a14379f';

/// See also [UserLogin].
@ProviderFor(UserLogin)
final userLoginProvider =
    AutoDisposeNotifierProvider<UserLogin, String>.internal(
  UserLogin.new,
  name: r'userLoginProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userLoginHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserLogin = AutoDisposeNotifier<String>;
String _$passwordLoginHash() => r'e9fd30a3e3c86f6086fd15d1b1ac5c0bac653e36';

/// See also [PasswordLogin].
@ProviderFor(PasswordLogin)
final passwordLoginProvider =
    AutoDisposeNotifierProvider<PasswordLogin, String>.internal(
  PasswordLogin.new,
  name: r'passwordLoginProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$passwordLoginHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PasswordLogin = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
