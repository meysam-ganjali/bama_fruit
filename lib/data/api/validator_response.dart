
import 'package:bama_fruit/data/api/app_exception.dart';
import 'package:dio/dio.dart';

mixin HttpResponseValidator{
 AppException validateResponse(Response response) {
    if (response.statusCode != 200) {
      return AppException();
    }
    else if(response.statusCode == 401)
    {
    return  AppException(message: "Invalid_Login");
    }
    return AppException(message: "OK");
  }
}