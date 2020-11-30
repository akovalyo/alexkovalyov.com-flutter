import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List> getPosts() async {
  final Query postsRef = FirebaseFirestore.instance.collection('posts');
}
