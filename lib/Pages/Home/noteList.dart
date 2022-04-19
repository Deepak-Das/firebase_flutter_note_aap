import 'package:firebase_flutter_note_aap/Pages/Home/componets/popMenuTiles.dart';
import 'package:firebase_flutter_note_aap/models/noteModel.dart';
import 'package:firebase_flutter_note_aap/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  String _selection = '';

  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<List<NoteModel>>(context);
    final user = Provider.of<UserModel>(context);
    // for(var doc in notes.docs){
    //   print("key : ${doc.id} note : ${doc.data()}");
    // }
    // notes.forEach((element) {
    //   print(element.id);
    // });
    // print("=============================");
    return ListView(
      children: notes.map((note) => PopMenuTiles(note: note, user: user)).toList(),
    );
  }
}
