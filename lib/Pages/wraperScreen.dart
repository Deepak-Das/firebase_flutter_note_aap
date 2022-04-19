import 'package:firebase_flutter_note_aap/Pages/Auth/authScreen.dart';
import 'package:firebase_flutter_note_aap/Pages/Auth/registerScreen.dart';
import 'package:firebase_flutter_note_aap/Pages/Auth/singInScreen.dart';
import 'package:firebase_flutter_note_aap/Pages/Home/noteScreen.dart';
import 'package:firebase_flutter_note_aap/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class WrapperScreen extends StatefulWidget {
  const WrapperScreen({Key? key}) : super(key: key);

  @override
  State<WrapperScreen> createState() => _WrapperScreenState();
}

class _WrapperScreenState extends State<WrapperScreen> {
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<UserModel?>(context);
    if(user!=null){
      return NoteScreen();
    }else{
      return AuthScreen();
    }

  }
}
