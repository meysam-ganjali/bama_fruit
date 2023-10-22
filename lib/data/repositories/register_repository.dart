import 'package:bama_fruit/app/models/register/register_entity.dart';
import 'package:bama_fruit/data/api/http_client.dart';
import 'package:bama_fruit/data/sources/register_data_source.dart';
final registerRepository = RegisterRepository(RegisterRemoteDataSource(httpClient));
abstract class IRegisterRepository{
  Future<Map<String,String>>registerUser({required String userName});
  Future<String> activateAccount({required RegisterEntity registerEntity});
}

class RegisterRepository implements IRegisterRepository{
  final IRegisterDataSource datasource;

  RegisterRepository(this.datasource);
  @override
  Future<Map<String,String>> registerUser({required String userName}) => datasource.registerUser(userName: userName);
  
  @override
  Future<String> activateAccount({required registerEntity}) =>datasource.activateAccount(registerEntity: registerEntity);

}