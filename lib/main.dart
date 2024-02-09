import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uihr/login/cubit.dart';
import 'package:uihr/main.dart';
import 'package:uihr/login/hr.dart';

import 'dio_helper.dart';



void main()async {
  runApp(MyApp());
  await Dio;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=>LoginCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:hr(),

      ),
    );
  }


}