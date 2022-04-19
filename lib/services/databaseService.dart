import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_flutter_note_aap/models/noteModel.dart';

class DatabaseService {
  late String uid;

  DatabaseService({required this.uid});

  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  NoteModel _getNote({required String id, required String name, required String Qty}){
    return NoteModel(id: id, name: name, Qty: Qty);
  }

  void setNote(String name, String qty) {
    final ref = fireStore
        .collection("Users")
        .doc(uid)
        .collection("Notes")
        .doc()
        .set({"Name": name, 'Qty': qty});
  }

  List<NoteModel> _listOfNote(QuerySnapshot snapshot){
    return snapshot.docs.map((e) => _getNote(id: e.id, name: e.get("Name"), Qty: e.get('Qty'))).toList();
  }

  Stream<List<NoteModel>> noteStream() {
    return fireStore
        .collection("Users")
        .doc(uid)
        .collection("Notes")
        .snapshots().map(_listOfNote);
  }

  // Stream<QuerySnapshot> noteList() {
  //   return fireStore
  //       .collection("Users")
  //       .doc(uid)
  //       .collection("Notes")
  //       .snapshots().map((event) => _getNote(id, name, Qty));
  // }
}
