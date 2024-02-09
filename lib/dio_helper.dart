import 'package:dio/dio.dart';

class ApiConstants{
  static Dio ?dio ;
  static String BASEURL =  "http://148.113.1.230:2060/";
  static getFullHeader(){
    return {
    };
  }

  static get(){
    return Dio(
        BaseOptions(
            baseUrl: BASEURL,
            connectTimeout: Duration(seconds: 60*1000), // 60 seconds
            receiveTimeout:  Duration(seconds: 60*1000) // 60 seconds
        )
    );
  }



}