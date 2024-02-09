import 'package:uihr/login/model.dart';

abstract class LoginStates{}

class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  LoginModel?loginModel;
  LoginSuccessState( this.loginModel);
}
class LoginErrorState extends LoginStates{
  final String error;
  LoginErrorState(this.error);
}