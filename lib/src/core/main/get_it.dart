import 'package:get_it/get_it.dart';
import 'package:random_user_api_flutter/src/view_models/person_store.dart';

final getIt = GetIt.I;

void initGetItStores() {
  getIt.registerLazySingleton(() => PersonStore());
}
