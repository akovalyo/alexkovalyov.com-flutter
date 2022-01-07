import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'models/post.dart';
import 'helpers.dart';
import 'consts/consts.dart';
import 'navigation/routes.dart';
import 'widgets/hover_blog_container.dart';

class AppState with ChangeNotifier {
  List<Post> _posts = <Post>[];
  List nfts = [];

  List<Post> get posts => _posts;

  Future<void> firebaseInit() async {
    try {
      await Firebase.initializeApp();
    } catch (error) {
      print('firebase init error: $error');
    }
  }

  Future<void> loadPosts() async {
    final Query postsRef = FirebaseFirestore.instance.collection('posts');
    final QuerySnapshot snapshot =
        await postsRef.orderBy('date', descending: true).get();

    snapshot.docs.forEach((pst) {
      Post post = Post.fromData(pst.data());
      post.postId = pst.id;

      _posts.add(post);
    });
    notifyListeners();
  }

  bool postExists(String path) {
    var contain = _posts.where((e) => e.path == path);
    return contain.isNotEmpty;
  }

  // Get existing post by path, confirm with postExists() before using
  Post getPostByPath(String path) {
    return _posts.firstWhere((p) => p.path == path);
  }

  List<Widget> getPostCards(
    BuildContext context,
  ) {
    final isSmall = isSmallScreen(context);
    final cardSize = isSmall
        ? Size(postCardSWidth, postCardSHeight)
        : Size(postCardLWidth, postCardLHeight);
    final _cardHoverSize = isSmall
        ? Size(postCardSHoverWidth, postCardSHoverHeight)
        : Size(postCardLHoverWidth, postCardLHoverHeight);

    List<Widget> cards = [];
    if (_posts.isNotEmpty)
      _posts.forEach((post) {
        cards.add(
          GestureDetector(
            onTap: () {
              navKey.currentState!.pushNamed(post.path);
            },
            child: HoverBlogContainer(
              width: cardSize.width,
              hoverWidth: _cardHoverSize.width,
              height: cardSize.height,
              hoverHeight: _cardHoverSize.height,
              image: post.imageUrl,
              title: post.title,
              description: post.description,
              borderRadius: 10,
            ),
          ),
        );
      });
    return cards;
  }

  Future loadNftCollection() async {
    final Query postsRef = FirebaseFirestore.instance.collection('posts');
// TODO
    notifyListeners();
  }
}
