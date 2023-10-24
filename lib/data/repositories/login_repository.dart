import 'package:bama_fruit/app/models/login/login_entity.dart';
import 'package:bama_fruit/data/api/http_client.dart';
import 'package:bama_fruit/data/sources/login_data_source.dart';

final loginRepository = LoginRepository(loginRemoteDataSource(httpClient));
abstract class ILoginRepository{
   Future<LoginEntity> loginUser({required LoginParameter param});
}

class LoginRepository implements ILoginRepository{
  final ILoginDataSource dataSourse;

  LoginRepository(this.dataSourse);
  @override
  Future<LoginEntity> loginUser({required LoginParameter param})=>dataSourse.loginUser(param: param);

}