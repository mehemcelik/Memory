import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  

  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('Users');
  
  Future updateUserData(String username, int score) async{
    return await usersCollection.doc().set({
      'User name': username,
      'Score': score,
    });
  }
}