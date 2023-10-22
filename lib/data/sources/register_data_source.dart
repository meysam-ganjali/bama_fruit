import 'package:bama_fruit/app/models/register/register_entity.dart';
import 'package:bama_fruit/data/api/validator_response.dart';
import 'package:dio/dio.dart';

abstract class IRegisterDataSource{
  Future<Map<String,String>> registerUser({required String userName});
  Future<String> activateAccount({required RegisterEntity registerEntity});
}

class RegisterRemoteDataSource with HttpResponseValidator implements IRegisterDataSource{
  final Dio httpClient;

  RegisterRemoteDataSource(this.httpClient);
  @override
  Future<Map<String,String>> registerUser({required String userName}) async{
    

    var response = await httpClient.post("users/register_user/",data: {
      "type": "send_sms",
      "username":userName
    });
    validateResponse(response);
    print(response.data.toString());
    return {
        "number":response.data['number'],
        "code":response.data['code']
    };
  }
  
  @override
  Future<String> activateAccount({required RegisterEntity registerEntity})async {

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

  
}