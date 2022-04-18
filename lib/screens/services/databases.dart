import 'package:brew/screens/model/brews.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference brewcollection =
      FirebaseFirestore.instance.collection('brew');

  // this fuction check if the uid is already exit or not if it exit it will gona show the data Or if it not exit it will create a new document
  Future UpdateUserData(String sugers, String name, int strength) async {
    print("uid from the data base $uid");
    return await brewcollection
        .doc(uid)
        .set({'suger': sugers, 'name': name, 'strength': strength});
  }

  // STREAM TO GET THE DATA
  Stream<List<Brew>> get brews {
    return brewcollection.snapshots().map(_brewListFromSnapshot);
  }

  // brew list from snap shot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      // var mylist=doc.data();
      return Brew(
          name: doc['name'], strength: doc['strength'], sugar: doc['suger']);
    }).toList();
  }

// get user doc stream
// PHELE SAARA DATA ESME AAE GA
  Stream<UserData> get userdata {
    return brewcollection
        .doc(uid)
        .snapshots()
        .map(_userDatafromSnapshot);
  }

// USME AANE KE BAAD HUM USHE WAHA PAR PASS KAR DIYA H AUR ES OBJECT/MODEL ME STORE KAR DIYA H

  UserData _userDatafromSnapshot(DocumentSnapshot snapshot) {
    print("testing 2 ${snapshot.data()}");
    print("testing 3 ${snapshot.get('suger')}");
    return 
    UserData(
        uid: uid,
        name: snapshot.get('name'),
        suger: snapshot.get('suger'),
        strength: snapshot.get('strength'));
  }
}
