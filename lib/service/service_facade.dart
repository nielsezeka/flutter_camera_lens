import './service_index.dart';
import 'package:get_it/get_it.dart';

class ServiceFacade {
  static final _getIt = GetIt.instance;
  static final lensApi = LensApi();
  static final lensDetailsApi = LensDetailsApi();
  static final searchParamApi = SearchParamApi();
  static registerDefaultService() {
    _getIt.registerSingleton<LensApi>(lensApi);
    _getIt.registerSingleton<LensDetailsApi>(lensDetailsApi);
    _getIt.registerSingleton<SearchParamApi>(searchParamApi);
  }

  static getService<T>() {
    return _getIt.get<T>();
  }
}
