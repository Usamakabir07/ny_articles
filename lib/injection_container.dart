import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ny_articles/infrastructure/articles/api/articles_api.dart';
import 'package:ny_articles/infrastructure/articles/articles_repository.dart';
import 'package:ny_articles/viewModels/articles_view_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'infrastructure/apiUtil/urls.dart';
import 'infrastructure/catalog_facade_service.dart';
// import 'infrastructure/catalog_facade_service.dart';

final GetIt serviceLocator = GetIt.instance;

// register all components to get it to inject the dependencies where we need it
Future<void> init() async {
  //core
  await registerCoreComponents();

  //catalog
  registerCatalog();

  //viewModel
  registerViewModel();

  //repository
  registerRepository();

  //ApiCall
  registerApiCalls();
}

///
/// api calls
///

registerApiCalls() {
  serviceLocator.registerLazySingleton(() => GetArticlesApi(
        dio: serviceLocator(),
      ));
}

///
/// view Model
///

registerViewModel() {
  serviceLocator.registerLazySingleton(() => ArticlesViewModel(
        catalogFacadeService: serviceLocator(),
      ));
}

///
/// repositories
///

registerRepository() {
  serviceLocator.registerLazySingleton(() => ArticlesRepository(
        articlesApi: serviceLocator(),
      ));
}

///
/// catalog
///

registerCatalog() {
  serviceLocator.registerLazySingleton(
      () => CatalogFacadeService(articlesRepository: serviceLocator()));
}

registerCoreComponents() async {
  serviceLocator.registerLazySingleton(() => getNetworkObj());
}

Dio getNetworkObj() {
  BaseOptions options = BaseOptions(
    baseUrl: Urls.kBaseUrl,
    connectTimeout: const Duration(milliseconds: 30000),
    receiveTimeout: const Duration(milliseconds: 30000),
  );
  Dio dio = Dio(options);

  //intercept every api request and add needed headers to it
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers['Content-Type'] = 'application/json';
        options.headers['Accept'] = 'application/json';
        options.headers['Access-Control-Allow-Origin'] = '*';
        handler.next(options);
      },
    ),
  );

  //dio logger to see every request and response
  //on the debug console, remove on release!!!
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 120,
  ));
  return dio;
}
