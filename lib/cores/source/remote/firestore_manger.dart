import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreManger {
  static addUser(){
   var collection= FirebaseFirestore.instance.collection('users');
   var document=collection.doc();// inisd the doc parentese the id let it null it will create automaticlay


  }
}