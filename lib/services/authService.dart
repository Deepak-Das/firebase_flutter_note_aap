import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_flutter_note_aap/models/user.dart';
import 'package:firebase_flutter_note_aap/services/databaseService.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel? _getUser(User? user) {
    return user !=null?UserModel(uid: user.uid): null;
  }

  Future userLogin(String email, String password) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // return _getUser(credential.user);
      // return DatabaseService(uid: credential.user!.uid);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Stream<UserModel?> user(){
    return _auth.authStateChanges().map(_getUser);
  }

  Future singAonymous() async {
    try {
      var result = await _auth.signInAnonymously();
      print(result.user);
      // return _getUser(result.user);
      return DatabaseService(uid: result.user!.uid);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future RegisterUser(String email,String pass) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      print(result.user);
      // return _getUser(result.user);
      // return DatabaseService(uid: result.user!.uid);

    } catch (e) {
      print(e.toString());
      return null;
    }
  }

   void singOut(){
    try{
      _auth.signOut();
    }catch(e){
      print(e.toString());
    }
  }
}

