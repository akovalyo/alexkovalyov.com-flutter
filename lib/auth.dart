import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {
  Future firebaseInit() async {
    try {
      await Firebase.initializeApp();
    } catch (error) {
      print('firebase init error: $error');
    }
  }

  Future loadDb() async {
    final Query postsRef = FirebaseFirestore.instance.collection('posts');
    try {
      final QuerySnapshot _snapshot =
          await postsRef.orderBy('date', descending: true).get();
      Map<String, Map> dbPosts = {};
      _snapshot.docs.forEach((pst) {
        dbPosts[pst.data()['path']] = pst.data();
      });
      return dbPosts;
    } catch (error) {
      print('error query posts: $error');
      return null;
    }
  }
}
