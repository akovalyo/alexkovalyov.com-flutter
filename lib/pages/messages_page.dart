import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';

class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppState appState = context.watch<AppState>();
    late CollectionReference messages;
    if (appState.isLoggedIn) {
      messages = FirebaseFirestore.instance.collection('messages');
    }
    return appState.isLoggedIn
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
              List<Widget> lst = snapshot.data!.docs.map((element) {
                Map<String, dynamic> data =
                    element.data() as Map<String, dynamic>;

                return Column(
                  children: <Widget>[
                    ListTile(
                      tileColor: Theme.of(context).primaryColor,
                      title: SelectableText(
                        data['mail'],
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
                      child: Text(data['date']),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: SelectableText(data['message']),
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
