import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

T getIt<T extends Object>({
  String? instanceName,
  Object? param1,
  Object? param2,
}) {
  return sl.get<T>(
    instanceName: instanceName,
    param1: param1,
    param2: param2,
  );
}
