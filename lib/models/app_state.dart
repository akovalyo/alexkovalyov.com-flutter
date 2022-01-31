import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'post.dart';
import '../helpers/screen_helper.dart';
import '../consts/consts.dart';
import '../navigation/routes.dart';
import '../widgets/hover_blog_container.dart';
import '../secrets.dart';

class AppState with ChangeNotifier {
  List<Post> _posts = <Post>[];
  bool _loggedIn = false;
  bool isLoading = false;
  bool isRightMenuOpen = false;

  bool get isLoggedIn => _loggedIn;

  List<Post> get posts => _posts;

  Future<void> firebaseInit() async {
    try {
      await Firebase.initializeApp(options: secrets);

      await FirebaseAppCheck.instance
          .activate(webRecaptchaSiteKey: reCaptchaSiteKey);
    } catch (error) {
      print('firebase init error: $error');
    }
  }

  void checkAuth() {
    _loggedIn = FirebaseAuth.instance.currentUser != null;
    notifyListeners();
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

  Future<void> logout() async {
    final auth = FirebaseAuth.instance;
    isLoading = true;
    notifyListeners();

    await auth.signOut();

    // TODO: Check for errors at signout

    _loggedIn = false;
    isLoading = false;
    notifyListeners();
  }

  Future<void> loadPosts() async {
    final Query postsRef = FirebaseFirestore.instance.collection('posts');
    final QuerySnapshot snapshot =
        await postsRef.orderBy('date', descending: true).get();

    snapshot.docs.forEach((pst) {
      Post post = Post.fromData(pst.data() as Map<String, dynamic>);
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

  List<Widget> getPostTiles(
    BuildContext context,
  ) {
    final isSmall = ScreenHelper.isSmallScreen(context);
    final postTileSize = isSmall
        ? Size(tileSmallWidth, tileSmallHeight)
        : Size(tileLargeWidth, tileLargeHeight);
    final _cardHoverSize = isSmall
        ? Size(tileSmallWidth + 15, tileSmallHeight + 15)
        : Size(tileLargeWidth + 15, tileLargeHeight + 15);

    List<Widget> tiles = [];
    if (_posts.isNotEmpty)
      _posts.forEach((post) {
        tiles.add(
          GestureDetector(
            onTap: () {
              navKey.currentState?.pushNamed(post.path);
            },
            child: HoverBlogContainer(
              width: postTileSize.width,
              hoverWidth: _cardHoverSize.width,
              height: postTileSize.height,
              hoverHeight: _cardHoverSize.height,
              image: post.imageUrl,
              title: post.title,
              description: post.description,
              borderRadius: 10,
            ),
          ),
        );
      });
    return tiles;
  }
}
