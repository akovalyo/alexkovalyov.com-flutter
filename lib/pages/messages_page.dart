import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _isLogged = FirebaseAuth.instance.currentUser != null;
    CollectionReference messages;
    if (_isLogged) {
      messages = FirebaseFirestore.instance.collection('messages');
    }
    return _isLogged
        ? StreamBuilder<QuerySnapshot>(
            stream: messages.snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Something went wrong',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              List<Widget> lst = snapshot.data.docs.map((element) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      tileColor: Theme.of(context).primaryColor,
                      title: SelectableText(
                        element.data()['mail'],
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          CollectionReference messages =
                              FirebaseFirestore.instance.collection('messages');
                          messages.doc(element.id).delete();
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(element.data()['date']),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: SelectableText(element.data()['message']),
                    ),
                  ],
                );
              }).toList();
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      'Messages',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        children: lst,
                      ),
                    ),
                  ),
                ],
              );
            })
        : Center(
            child: Text(
              'Please login!',
              style: Theme.of(context).textTheme.headline4,
            ),
          );
  }
}
