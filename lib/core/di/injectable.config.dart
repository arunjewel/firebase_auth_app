// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../application/auth/auth_bloc.dart' as _i7;
import '../../application/profile/profile_bloc.dart' as _i8;
import '../../domain/auth/auth_service.dart' as _i3;
import '../../domain/profile/profile_services.dart' as _i5;
import '../../repository/auth_repo.dart' as _i4;
import '../../repository/profile_repo.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.AuthService>(() => _i4.AuthRepo());
  gh.lazySingleton<_i5.ProfileService>(() => _i6.ProfileRepo());
  gh.factory<_i7.AuthBloc>(
      () => _i7.AuthBloc(authService: get<_i3.AuthService>()));
  gh.factory<_i8.ProfileBloc>(
      () => _i8.ProfileBloc(profileService: get<_i5.ProfileService>()));
  return get;
}
