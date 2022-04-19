import 'package:firebase_flutter_note_aap/models/noteModel.dart';
import 'package:firebase_flutter_note_aap/models/user.dart';
import 'package:flutter/material.dart';

class PopMenuTiles extends StatefulWidget {

  NoteModel note;
  UserModel user;
  PopMenuTiles({required this.note, required this.user });
  @override
  State<PopMenuTiles> createState() => _PopMenuTilesState();
}

class _PopMenuTilesState extends State<PopMenuTiles> {

  String _select='';

  @override
  Widget build(BuildContext context) {

    return PopupMenuButton<String>(
      onSelected: (String value){
        setState(() {
          _select=value;
        });
        if(_select=="Delete"){
          widget.note.deleteNote(widget.user.uid);
        }
      },
      child: Card(
        child: ListTile(
          leading: Icon(Icons.note,color: Colors.blueGrey,),
          title: Text('Name: ${widget.note.name}'),
          subtitle: Text('Quantity: ${widget.note.Qty}'),
        ),
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'Delete',
          child: Text('Delete'),
        ),
      ],
    )
    ;
  }
}
