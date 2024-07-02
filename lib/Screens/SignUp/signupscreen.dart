import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/Screens/SignUp/Blocs/signupbloc.dart';
import 'package:todoapp/Screens/SignUp/Blocs/signupstates.dart';
import 'package:todoapp/Screens/SignUp/Controllers/signupcontroller.dart';
import 'package:todoapp/Widgets/uihelper.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController usernameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp Screen"),
        centerTitle: true,
      ),
      body: BlocConsumer<SignUpBloc,SignUpStates>(
        listener: (context,state){
          if(state is SignUpLoadedStates){
            log(state.signUpModel.data!.username.toString());
          }
          else if(state is SignUpErrorStates){
            log(state.error.toString());
          }
        },
        builder: (context,state){
          if(state is SignUpLoadingStates){
            return Center(child: CircularProgressIndicator(),);
          }
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.CustomTextField(emailController, "Enter Email", Icons.mail),
                UiHelper.CustomTextField(passwordController,"Enter Password", Icons.password),
                UiHelper.CustomTextField(usernameController,"Enter Username", Icons.person),
                UiHelper.CustomTextField(phoneController,"Enter Phone Number", Icons.phone),
                SizedBox(height: 20.h,),
                ElevatedButton(onPressed: (){
                  SignUpController.SignUp(emailController.text.toString(), passwordController.text.toString(), usernameController.text.toString(), phoneController.text.toString(), context);
                }, child: Text("SignUp"))
              ],),
          );
        },
      )
    );
  }
}
