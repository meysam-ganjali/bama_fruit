
import 'package:bama_fruit/data/api/api_urls.dart';
import 'package:dio/dio.dart';

final httpClient = Dio(BaseOptions(baseUrl: ApiUrls.apiBaseUrl));