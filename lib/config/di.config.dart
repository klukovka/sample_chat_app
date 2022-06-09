// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/firebase_api.dart' as _i5;
import '../bloc/verify_phone_number_page/verify_phone_number_page_cubit.dart'
    as _i6;
import '../router/app_auto_router.gr.dart' as _i4;
import '../router/chat_app_router.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $configureDependencies(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.ChatAppRouter>(
      () => _i3.ChatAppRouter(get<_i4.AppAutoRouter>()));
  gh.factory<_i5.FirebaseApi>(() => _i5.FirebaseApi());
  gh.factoryParam<_i6.VerifyPhoneNumberPageCubit, String?, dynamic>(
      (phoneNumber, _) =>
          _i6.VerifyPhoneNumberPageCubit(get<_i5.FirebaseApi>(), phoneNumber));
  return get;
}
