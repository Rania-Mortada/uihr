import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uihr/login/cubit.dart';
import 'package:uihr/login/states.dart';
import '../home/home_screen.dart';
class hr extends StatefulWidget{
  @override
  State<hr> createState() => _hrState();
}

class _hrState extends State<hr> {
  var  emailController =TextEditingController();

  var passowrdController=TextEditingController();
@override
  void initState() {
    // TODO: implement initState
  LoginCubit.get(context).Login;
    super.initState();
  }
  @override
  Widget build (BuildContext context){
    return BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){

            if(state is LoginSuccessState)
            {

              print("................444444544...............");
              if(state.loginModel!.token!=null){
                print(".....................................");
                Fluttertoast.showToast(
                    msg: "success",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              }
            }else{
              print("error........................................");
              Fluttertoast.showToast(
                  msg: "error",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }


        },
        builder: (context,state){

          if(state is LoginLoadingState){
            return
        Center(child: CircularProgressIndicator())
            ;

          }else{
            return Scaffold(

              backgroundColor:  Color(0xFFF3A155),
              appBar: AppBar(elevation:0,

                backgroundColor: Colors.transparent,
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // do something
                    },
                  ),

                  SizedBox(width: 260,),
                  IconButton(padding: EdgeInsets.only(right: 30),
                    icon: Icon(
                      Icons.translate,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // do something
                    },
                  )
                ],

              ),
              body:
              Center(
                child:
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // CircleAvatar(
                        //   radius: 125,
                        //   backgroundColor: Colors.grey,
                        //   child: CircleAvatar(
                        //     radius: 120,
                        //     backgroundImage: AssetImage('asss/ggg.png'),
                        //   ),
                        // ),
                        SizedBox(height: 50,),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                              color: Colors.white
                          ),
                          //color: Colors.white,
                          child: TextFormField(
                            controller: emailController,
                            //  keyboardType: TextInputType.emailAddress,
                            onFieldSubmitted: (String)
                            {
                              print(String);

                            },
                            decoration: InputDecoration(
                                labelText: 'Eamil Adderss',
                                prefixIcon: Icon(
                                    Icons.email_outlined
                                ),
                                border: OutlineInputBorder()
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                              color: Colors.white
                          ),
                          //color: Colors.white,
                          child: TextFormField(
                            controller: passowrdController,
                            // keyboardType: TextInputType.visiblePassword,
                            //  obscureText: true,
                            onFieldSubmitted: (String)
                            {
                              print(String);

                            },
                            onChanged: (string){
                              print(string);
                            },
                            decoration: InputDecoration(
                                labelText: 'password',
                                prefixIcon: Icon(
                                    Icons.lock
                                ),
                                suffixIcon: Icon(
                                    Icons.remove_red_eye_sharp
                                ),

                                border: OutlineInputBorder()
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\t have an account?',

                            ),
                            TextButton(
                                onPressed: (){},
                                child: Text('Regstir Now'))
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),


                            color: Color(0xFFF0F3FA),
                          ),
                          width: double.infinity,
                          //color: Color(0xFFF3A155),
                          child: MaterialButton(
                            onPressed: (){
                              print(emailController.text);
                              print(passowrdController.text);
                              LoginCubit.get(context).Login(
                                  userName: emailController.text, password: passowrdController.text);
                            },

                            child: Text('LOGIN',style: TextStyle(color: Colors.black),),
                          ),
                        ),
                        /* ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child:  Image.asset('asss/ggg.png',width: 600,height: 300,)

                      ),*/

                      ],
                    ),
                  ),
                ),
              ),

            );
          }

        }, );

  }
}
