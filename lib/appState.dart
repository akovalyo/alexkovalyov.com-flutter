import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppState {
  Future firebaseInit() async {
    try {
      await Firebase.initializeApp();
    } catch (error) {
      print('firebase init error: $error');
    }
  }

  Future<Map<String, Map>> loadDb() async {
    final Query postsRef = FirebaseFirestore.instance.collection('posts');
    Map<String, Map> dbPosts = {};
    try {
      final QuerySnapshot _snapshot =
          await postsRef.orderBy('date', descending: true).get();

      _snapshot.docs.forEach((pst) {
        dbPosts[pst.data()!['path']] = pst.data()!;
      });
      return dbPosts;
    } catch (error) {
      print('error query posts: $error');
      return dbPosts;
    }
  }

  Future loadNftCollection() async {}
}
