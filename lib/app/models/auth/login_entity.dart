class LoginParameter {
  final String userName;
  final String passwprd;

  LoginParameter({required this.userName, required this.passwprd});
}


class AuthInfo{
  final String refresh;
  final String access;



  AuthInfo(this.refresh, this.access);

}