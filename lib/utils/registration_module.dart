import 'package:budget_tracker/utils/utils.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegistrationModule {
  @preResolve
  Future<LocalStorage> get localStorage => HiveLocalStorage.init();
}
