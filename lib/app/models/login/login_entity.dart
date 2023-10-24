class LoginParameter {
  final String userName;
  final String passwprd;

  LoginParameter({required this.userName, required this.passwprd});
}

class LoginEntity {
  final String refreshToken;
  final String accessToken;
 late String err;

LoginEntity(this.err,this.accessToken,this.refreshToken);

  LoginEntity.fromJson(Map<String, dynamic> json)
      : refreshToken = json['refresh'],
        accessToken = json['access'],
        err="";
}
