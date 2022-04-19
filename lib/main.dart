import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_flutter_note_aap/Pages/wraperScreen.dart';
import 'package:firebase_flutter_note_aap/models/user.dart';
import 'package:firebase_flutter_note_aap/services/authService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(StreamProvider<UserModel?>.value(
      value: AuthService().user(),
      initialData: null,
      child: MaterialApp(
    home: WrapperScreen(),
  )));
}
