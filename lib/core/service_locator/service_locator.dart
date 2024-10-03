import 'package:get_it/get_it.dart';
import 'package:to_do_app_ageeza/core/database/cache_helper.dart';

final sL = GetIt.instance;
Future<void> setup() async {
  sL.registerLazySingleton<CacheHelper>(() => CacheHelper());
}
