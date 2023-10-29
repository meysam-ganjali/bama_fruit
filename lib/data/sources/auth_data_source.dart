import 'package:bama_fruit/app/models/auth/login_entity.dart';
import 'package:bama_fruit/app/models/register/register_entity.dart';
import 'package:bama_fruit/app/models/user/user_entity.dart';
import 'package:bama_fruit/data/api/validator_response.dart';
import 'package:dio/dio.dart';

abstract class IAuthDataSource{
  Future<AuthInfo> login(LoginParameter param);
  Future<Map<String,String>> register(String userName);
  Future<String> activeAccount(RegisterEntity registerEntity);
  Future<UserEntity> getUserInformation();
  
}

class AuthRemoteDataSource with HttpResponseValidator implements IAuthDataSource{
  final Dio httpClient;

  AuthRemoteDataSource(this.httpClient);
  @override
  Future<AuthInfo> login(LoginParameter param)async {
     try {
      var response = await httpClient.post("token/",
          data: {"username": param.userName, "password": param.passwprd});
      validateResponse(response);
       return AuthInfo(response.data["refresh"], response.data["access"]);
    } catch (e) {
     
      return AuthInfo("", "");
    }
  }

  @override
  Future<Map<String,String>> register(String userName)async {
   var response = await httpClient.post("users/register_user/",data: {
      "type": "send_sms",
      "username":userName
    });
    validateResponse(response);
     return {
        "number":response.data['number'],
        "code":response.data['code']
    };
  }
  
  @override
  Future<String> activeAccount(RegisterEntity registerEntity) async{
   var response = await httpClient.post("users/register_user/",data: {
      "type": "send_data",
      "username":registerEntity.username,
      "password":registerEntity.password,
      "fullname":registerEntity.fullname,
      "active_code":registerEntity.active_code,
    });
    validateResponse(response);
    print(response.data.toString());
    return response.data.toString();
  }
  
  @override
  Future<UserEntity> getUserInformation() async {
    var response = await httpClient.get("users/get_information_user/");
    validateResponse(response);
    return UserEntity(id: response.data["id"], userFullName: response.data["user_fullname"], userName: response.data["username"]);
  }
  


}