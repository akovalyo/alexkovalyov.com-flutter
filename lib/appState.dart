import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'models/post.dart';

class AppState with ChangeNotifier {
  List posts = [];
  List nfts = [];

  Future<void> firebaseInit() async {
    try {
      await Firebase.initializeApp();
    } catch (error) {
      print('firebase init error: $error');
    }
  }

  Future<void> loadPosts() async {
    final Query postsRef = FirebaseFirestore.instance.collection('posts');
    List<Post> posts = [];
    try {
      final QuerySnapshot _snapshot =
          await postsRef.orderBy('date', descending: true).get();

      _snapshot.docs.forEach((pst) {
        Post post = Post.fromData(pst.data());
        post.postId = pst.id;
        posts.add(post);
      });
    } catch (error) {
      print('error query posts: $error');
    }
  }

  Future loadNftCollection() async {}
}
