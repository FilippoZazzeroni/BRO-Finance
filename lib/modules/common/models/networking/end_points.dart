class EndPoints {
  //MARK: properties

  static const _baseUrl = "http://127.0.0.1:3000/";

  //MARK: methods

  static String singIn() => "${_baseUrl}users/tokens/sing_in";

  static String signUp() => "${_baseUrl}users/tokens/sign_up";
}
