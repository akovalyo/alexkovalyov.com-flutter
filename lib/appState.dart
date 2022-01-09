import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'models/post.dart';
import 'helpers.dart';
import 'consts/consts.dart';
import 'navigation/routes.dart';
import 'widgets/hover_blog_container.dart';

class AppState with ChangeNotifier {
  List<Post> _posts = <Post>[];
  List _nfts = [];
  bool _loggedIn = false;
  bool isLoading = false;

  bool get isLoggedIn => _loggedIn;

  List<Post> get posts => _posts;

  Future<void> firebaseInit() async {
    try {
      await Firebase.initializeApp();
    } catch (error) {
      print('firebase init error: $error');
    }
    _loggedIn = FirebaseAuth.instance.currentUser != null;
  }

  void authenticate(String user, String password, BuildContext context) async {
    final auth = FirebaseAuth.instance;

    try {
      isLoading = true;
      notifyListeners();

      await auth.signInWithEmailAndPassword(email: user, password: password);

      isLoading = false;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Welcome!'),
          backgroundColor: Colors.green[600]!.withOpacity(0.7),
        ),
      );
      _loggedIn = true;
      navKey.currentState?.pushNamed(Routes.home.path);
    } catch (e) {
      var message = 'An error occured, please check your credentialas!';
      isLoading = false;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor.withOpacity(0.7),
        ),
      );
    }
  }

  void logout() async {
    final auth = FirebaseAuth.instance;
    isLoading = true;
    notifyListeners();

    await auth.signOut();

    // TODO: Check for errors at signout

    _loggedIn = false;
    isLoading = true;
    notifyListeners();
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
