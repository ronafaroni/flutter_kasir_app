import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final sl = GetIt.instance;

void initDependency() {
  // Check if Dio has already been registered
  if (!sl.isRegistered<Dio>()) {
    // Create a Dio instance with additional options
    final Dio dio = Dio(BaseOptions(
      baseUrl: 'https://your-api-base-url.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));

    // Add PrettyDioLogger interceptor
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false, // Set to false if headers are too large
        compact: true,
        maxWidth: 90,
      ),
    );

    // Register Dio singleton
    sl.registerSingleton<Dio>(dio);
  }
}
