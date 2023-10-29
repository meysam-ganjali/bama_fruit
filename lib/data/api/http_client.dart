
import 'package:bama_fruit/data/api/api_urls.dart';
import 'package:bama_fruit/data/repositories/auth_repository.dart';
import 'package:dio/dio.dart';

final httpClient = Dio(BaseOptions(baseUrl: ApiUrls.apiBaseUrl))
..interceptors.add(InterceptorsWrapper(
  onRequest: (options, handler) {
     final authInfo = AuthRepository.authChangeNotifier.value;
          if (authInfo != null && authInfo.access.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer ${authInfo.access}';
          }

          handler.next(options);
  },
));