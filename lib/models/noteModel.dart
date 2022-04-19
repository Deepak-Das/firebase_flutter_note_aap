import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class NoteModel {
  String? id;
  String name;
  String Qty;

  NoteModel({required this.id,required this.name, required this.Qty});

  void deleteNote(String uid) {
    FirebaseFirestore.instance.collection("Users").doc(uid).collection("Notes").doc(id).delete();
  }
}
