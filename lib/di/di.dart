import 'package:calendar_app/data%20source/local/local_data_source.dart';
import 'package:calendar_app/data%20source/remote/remote_data_source.dart';
import 'package:get_it/get_it.dart';

import '../repository/user_repository.dart';

final getIt = GetIt.instance;

initModule() {
  getIt.registerLazySingleton<LocalDataSource>(() => LocalDataSource());
  getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource());
  getIt.registerLazySingleton<UserRepository>(
      () => UserRepository(localSource: getIt(), remoteSource: getIt()));
}