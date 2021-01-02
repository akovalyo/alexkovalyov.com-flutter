import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:mysite/models/posts_model.dart';
import 'package:mysite/widgets/post_builder.dart';

class PostElementContainer extends StatelessWidget {
  final Widget child;
  final double vertPadding;
  final double horPadding;
  final Color background;
  final Alignment alignment;

  PostElementContainer({
    this.child,
    this.vertPadding = 0,
    this.horPadding = 0,
    this.background,
    this.alignment = Alignment.centerLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: EdgeInsets.symmetric(
        vertical: vertPadding,
        horizontal: horPadding,
      ),
      child: child,
      color: background,
    );
  }
}

class PostPage extends StatefulWidget {
  final String path;
  PostPage(this.path);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  AutoScrollController _controller;
  var _isLoading = false;
  Map<String, dynamic> _postData;
  CollectionReference _bodyRef;
  DocumentSnapshot _snapshot;

  void _loadPostBody() async {
    try {
      setState(() {
        _isLoading = true;
      });
      _snapshot = await _bodyRef.doc('0').get();
    } catch (err) {
      setState(() {
        _isLoading = false;
      });
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);
    _postData =
        Provider.of<PostsModel>(context, listen: false).postsMap[widget.path];
    _bodyRef =
        FirebaseFirestore.instance.collection('posts/${_postData['id']}/body');
    _loadPostBody();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : PostBuilder(
            controller: _controller,
            postData: _postData,
            snapshot: _snapshot,
          );
  }
}
