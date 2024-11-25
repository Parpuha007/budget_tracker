// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:budget_tracker/features/add_transaction/domain/cubit/add_transaction_cubit.dart'
    as _i833;
import 'package:budget_tracker/features/list_transactions/domain/cubit/list_transactions_cubit.dart'
    as _i823;
import 'package:budget_tracker/features/statistics/domain/cubit/statistics_cubit.dart'
    as _i1046;
import 'package:budget_tracker/utils/registration_module.dart' as _i921;
import 'package:budget_tracker/utils/utils.dart' as _i416;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registrationModule = _$RegistrationModule();
    await gh.factoryAsync<_i416.LocalStorage>(
      () => registrationModule.localStorage,
      preResolve: true,
    );
    gh.singleton<_i823.ListTransactionsCubit>(
        () => _i823.ListTransactionsCubit());
    gh.singleton<_i833.AddTransactionCubit>(() => _i833.AddTransactionCubit());
    gh.singleton<_i1046.StatisticsCubit>(() => _i1046.StatisticsCubit());
    return this;
  }
}

class _$RegistrationModule extends _i921.RegistrationModule {}
