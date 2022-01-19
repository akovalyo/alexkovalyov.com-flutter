import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../helpers/screen_helper.dart';
import '../widgets/ak_button.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final _formKey = GlobalKey<FormState>();
  var _email = '';
  var _message = '';
  var _isLoading = false;

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();

      _sendMessage(
        _email.trim(),
        _message,
      );
    }
  }

  void _sendMessage(
    String mail,
    String message,
  ) async {
    try {
      setState(() {
        _isLoading = true;
      });

      await FirebaseFirestore.instance.collection('messages').add({
        'mail': mail,
        'message': message,
        'date': DateTime.now().toString(),
      });
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Thank you! Message has been sent!'),
          backgroundColor: Colors.green[600]!.withOpacity(0.7),
        ),
      );
      _formKey.currentState!.reset();
    } catch (error) {
      var message = 'Sorry! Something went wrong';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor.withOpacity(0.7),
        ),
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            'CONTACT',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        Container(
          width: 150,
          child: Divider(
            thickness: 5,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 20, bottom: _screenSize.height * 0.3),
          child: SizedBox(
            width: ScreenHelper.isSmallScreen(context)
                ? _screenSize.width * 0.7
                : _screenSize.width * 0.4,
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        key: ValueKey('Email'),
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Theme.of(context).colorScheme.secondary,
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                        ),
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value!;
                        },
                      ),
                      TextFormField(
                        key: ValueKey('Message'),
                        cursorColor: Theme.of(context).colorScheme.secondary,
                        style: Theme.of(context).textTheme.bodyText1,
                        minLines: 3,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: 'Message',
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your message';
                          }
                          if (value.length < 10) {
                            return 'Message is too short';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _message = value!;
                        },
                      ),
                      Container(height: 20),
                      _isLoading
                          ? Center(child: CircularProgressIndicator())
                          : AkButton(
                              onPressed: _trySubmit,
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
