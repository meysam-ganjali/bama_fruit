import 'package:bama_fruit/app/models/login/login_entity.dart';
import 'package:bama_fruit/data/api/app_exception.dart';
import 'package:bama_fruit/data/api/validator_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class ILoginDataSource {
  Future<LoginEntity> loginUser({required LoginParameter param});
}

class loginRemoteDataSource
    with HttpResponseValidator
    implements ILoginDataSource {
  final Dio httpClient;

  loginRemoteDataSource(this.httpClient);
  @override
  Future<LoginEntity> loginUser({required LoginParameter param}) async {
    try {
      var response = await httpClient.post("token/",
          data: {"username": param.userName, "password": param.passwprd});
      AppException res = validateResponse(response);
      if (res.message == "Invalid_Login") {
        return LoginEntity(res.message, "", "");
      }
      LoginEntity entity = LoginEntity.fromJson(response.data);
      return entity;
    } catch (e) {
      debugPrint(e.toString());
      return LoginEntity("401", "accessToken", "refreshToken");
    }
  }
}
