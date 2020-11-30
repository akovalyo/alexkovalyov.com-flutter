import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class PostModel {
//   final String title;
//   final String path;
//   final String date;
//   final String description;
//   final String image;
//   final List<String> tags;
//   final String body;

//   PostModel
// }

class PostsGetter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Query postsRef = FirebaseFirestore.instance.collection('posts');

    return FutureBuilder<QuerySnapshot>(
      future: postsRef.get(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Something went wrong"));
        }
        if (snapshot.connectionState == ConnectionState.done) {
          // _posts = snapshot.data.docs.toList();
          // print(snapshot.data.docs[0].data());

          snapshot.data.docs.forEach((pst) {
            print(pst.data());
          });
          return PostsView();
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class PostsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 60,
      children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.green[200],
          child: Center(
            child: Text('Test'),
          ),
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.green[200],
          child: Center(
            child: Text('Test'),
          ),
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.green[200],
          child: Center(
            child: Text('Test'),
          ),
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.green[200],
          child: Center(
            child: Text('Test'),
          ),
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.green[200],
          child: Center(
            child: Text('Test'),
          ),
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.green[200],
          child: Center(
            child: Text('Test'),
          ),
        )
      ],
    );
  }
}
