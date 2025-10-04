abstract class AuthStates {}

class AuthInitialState extends AuthStates{}

class LoadingLogin extends AuthStates{}

class LoginSuccessful extends AuthStates{}

class LoginFail extends AuthStates{
  final String errorMessage;
  LoginFail({required this.errorMessage});
}


class LoadingSingUp extends AuthStates{}

class SingUpSuccessful extends AuthStates{
  final String message;
  SingUpSuccessful({required this.message});
}

class SingUpFail extends AuthStates{
  final String errorMessage;

  SingUpFail({required this.errorMessage});
}

class LoadingRestPassword extends AuthStates{}

class RestPasswordSuccessful extends AuthStates{
  final String message;
  RestPasswordSuccessful({required this.message});
}

class RestPasswordFail extends AuthStates{
  final String errorMessage;

  RestPasswordFail({required this.errorMessage});
}