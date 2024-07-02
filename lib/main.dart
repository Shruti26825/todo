import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/Screens/SignUp/Blocs/signupbloc.dart';
import 'package:todoapp/Screens/SignUp/signupscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=>SignUpBloc())
        ],
        child: MaterialApp(
          title: 'Notes App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: false,
          ),
          home: SignUpScreen()
        ),
      ),
    );
  }
}