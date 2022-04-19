import 'package:firebase_flutter_note_aap/models/user.dart';
import 'package:firebase_flutter_note_aap/services/authService.dart';
import 'package:firebase_flutter_note_aap/services/databaseService.dart';
import 'package:flutter/material.dart';

class RegisterSreen extends StatefulWidget {

  final Function toggleView;
  RegisterSreen({required this.toggleView});

  @override
  State<RegisterSreen> createState() => _RegisterSreenState();
}

class _RegisterSreenState extends State<RegisterSreen> {

  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();
  final _auth=AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text("Register"),
          actions: [
            TextButton(
              onPressed: (){widget.toggleView();} ,
              child: Text("SingIn"),
              style: TextButton.styleFrom(
                  primary: Theme
                      .of(context)
                      .colorScheme
                      .onPrimary),
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
                    validator: (val) =>
                    val!.length < 6
                        ? "length is short"
                        : null,
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
                TextFormField(
                    validator: (val) =>
                    val != password
                        ? "password not match"
                        : null,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter the password again",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    )),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // var db= _auth.RegisterUser(email, password) as DatabaseService;
                      // db.setNote();

                      _auth.RegisterUser(email, password);

                    }
                  },
                  child: Text("Register"),)
              ],
            ),
          ),
        ));
  }
}
