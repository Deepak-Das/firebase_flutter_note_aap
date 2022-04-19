import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_flutter_note_aap/Pages/Home/noteList.dart';
import 'package:firebase_flutter_note_aap/models/noteModel.dart';
import 'package:firebase_flutter_note_aap/models/user.dart';
import 'package:firebase_flutter_note_aap/services/authService.dart';
import 'package:firebase_flutter_note_aap/services/databaseService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  UserModel? user;
  late final TextEditingController _controller = TextEditingController();
  String name = '';
  String Qyt = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<UserModel>(context);
    return StreamProvider<List<NoteModel>?>.value(
      value: DatabaseService(uid: user!.uid).noteStream(),
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notes"),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  AuthService().singOut();
                },
                child: Text('Sign out'),
                style: TextButton.styleFrom(
                    primary: Theme.of(context).colorScheme.onPrimary))
          ],
        ),
        body: NoteList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showMyDialog();
          },
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Note'),
          content: SingleChildScrollView(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      onChanged: (val) => {setState(() => name = val)},
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Name",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        onChanged: (val) => {setState(() => Qyt = val)},
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Quntity",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                        )),
                  ],
                ),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Submit'),
              onPressed: () {
                if (name.isNotEmpty && Qyt.isNotEmpty) {
                  DatabaseService(uid: user!.uid).setNote(name, Qyt);
                  setState(() {
                    name = '';
                    Qyt = '';
                  });
                }

                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
