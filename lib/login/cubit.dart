import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uihr/login/model.dart';
import 'package:uihr/login/states.dart';

import '../dio_helper.dart';
String ? message;
class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel ?loginModel;

  Future<void> Login({
    required String? userName,
    required String?password,
  }) async {
    print("/////////////////////////");
    emit(LoginLoadingState());
    Dio dio = ApiConstants.get();
    return dio.post(
      "VanSales/Users/authenticate",
      data: {
        "name": userName,
        "password": password
      },
    ).then((value) {
      print("**********************************");
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      if(loginModel!.token==null){
        message=value.data;
      }
      emit(LoginSuccessState(loginModel!));
    });
    //     .catchError((error) {
    //   print(error.toString());
    //   emit(LoginErrorState(error.toString()));
    // }
    // );
  }
}
