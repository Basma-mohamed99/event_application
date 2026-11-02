import 'package:event_app/cores/source/remote/firestore_manger.dart';
import 'package:event_app/model/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Userprovider extends ChangeNotifier {
  UserModel ?user;

  getUser()async{
     user =await FirestoreManger.getUser(FirebaseAuth.instance.currentUser!.uid);
     print(user!.id);
     print("object");
    notifyListeners();

  }
}