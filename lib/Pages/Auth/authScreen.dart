import 'package:firebase_flutter_note_aap/Pages/Auth/registerScreen.dart';
import 'package:firebase_flutter_note_aap/Pages/Auth/singInScreen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

   bool ShowSingIn=true;

   void toggleView(){
     setState(() {
       ShowSingIn=!ShowSingIn;
     });
   }

  @override
  Widget build(BuildContext context) {
    if(ShowSingIn){
      return SingInScreen(toggleView: toggleView);
    }else{
      return RegisterSreen(toggleView: toggleView);
    }

  }
}
