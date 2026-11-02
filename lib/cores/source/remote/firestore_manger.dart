import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../model/UserModel.dart';

class FirestoreManger {
  static getUserCollection() {
    var collection= FirebaseFirestore.instance.collection('users').
    withConverter(
      fromFirestore: (snapshot, options) {
        var data = snapshot.data();
        var user = UserModel.fromFireStore(data!);
        return user;
      } ,
      toFirestore: (user, options) {
        return user.toFireStore();
      },);
    return collection;
  }
  static Future <void> addUsers(UserModel user) {
    var collection=getUserCollection();
   var doc=collection.doc(user.id);
    return doc.set(user);


  }
static  getUser (String uid)async{
    var collection=getUserCollection();
    var doc=collection.doc(uid);
    var snapshot=await doc.get();
    return snapshot.data();
  }

}