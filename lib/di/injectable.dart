import 'package:injectable/injectable.dart';

import 'injectable.config.dart';
import 'service_locator.dart';

@InjectableInit()
Future<void> configureDependencies(String environment) async {
  await sl.init(environment: environment);
}
