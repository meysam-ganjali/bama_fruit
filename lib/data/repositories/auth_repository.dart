import 'package:bama_fruit/app/models/auth/login_entity.dart';
import 'package:bama_fruit/app/models/register/register_entity.dart';
import 'package:bama_fruit/app/models/user/user_entity.dart';
import 'package:bama_fruit/data/api/http_client.dart';
import 'package:bama_fruit/data/sources/auth_data_source.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authRepository = AuthRepository(AuthRemoteDataSource(httpClient));

abstract class IAuthRepository {
  Future<void> login(LoginParameter param);
  Future<Map<String, String>> register(String userName);
  Future<String> activeAccount(RegisterEntity registerEntity);

  Future<void> singOut();
}

class AuthRepository implements IAuthRepository {
  final IAuthDataSource dataSource;
  static final ValueNotifier<AuthInfo?> authChangeNotifier =
      ValueNotifier(null);
  AuthRepository(this.dataSource);
  @override
  Future<AuthInfo> login(LoginParameter param) async {
    final AuthInfo authInfo = await dataSource.login(param);
    
    _persistAuthToken(authInfo);
    return authInfo;
  }

  @override
  Future<Map<String, String>> register(String userName) async {
    final Map<String, String> result = await dataSource.register(userName);
    return result;
  }

  @override
  Future<String> activeAccount(RegisterEntity registerEntity) async {
    final String result = await dataSource.activeAccount(registerEntity);
    return result;
  }

  Future<void> _persistAuthToken(AuthInfo authInfo) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString("access_token", authInfo.access);
    sharedPreferences.setString("refresh_token", authInfo.refresh);
    
  }

  Future<void> loadAuthInfo() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    final String accessToken =
        sharedPreferences.getString("access_token") ?? '';
    final String refreshToken =
        sharedPreferences.getString("refresh_token") ?? '';
    if (accessToken.isNotEmpty && refreshToken.isNotEmpty) {
      authChangeNotifier.value = AuthInfo(refreshToken, accessToken);
    }
    
  }
  

  
  
 



  @override
  Future<void> singOut() async{
   final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
        sharedPreferences.remove("access_token");
  }
}
