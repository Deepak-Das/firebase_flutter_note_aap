import 'package:firebase_flutter_note_aap/services/authService.dart';
import 'package:firebase_flutter_note_aap/services/databaseService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SingInScreen extends StatefulWidget {

  Function toggleView;
  SingInScreen({required this.toggleView});
  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  final _auth =AuthService();
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text("Sing In"),
          actions: [
            TextButton(
              onPressed: (){widget.toggleView();} ,
              child: Text("Register"),
              style: TextButton.styleFrom(
                  primary: Theme.of(context).colorScheme.onPrimary),
            )
          ],
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  onChanged: (val) => {setState(() => email = val)},
                  validator: (val) => val!.isEmpty ? "Enter the email" : null,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Email",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                    onChanged: (val) => {setState(() => password = val)},
                    validator: (val) => val!.length<6 ? "length is short" : null,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Password",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    )),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // var db= _auth.userLogin(email, password) as DatabaseService;
                        // // db.setNote();
                        _auth.userLogin(email, password);
                      }
                    },
                    child: Text("Sing in"),)
              ],
            ),
          ),
        ));
  }
}
