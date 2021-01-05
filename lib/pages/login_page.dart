import 'package:flutter/material.dart';

import 'package:mysite/consts/consts.dart';
import 'package:mysite/helpers.dart';
import 'package:mysite/page_elements/footer.dart';
import 'package:mysite/widgets/button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var _userName = '';
  var _userPassword = '';

  void _trySubmit() {
    final _isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (_isValid) {
      _formKey.currentState.save();

      _authenticate(_userName, _userPassword);
    }
  }

  void _authenticate(String username, String password) {}

  @override
  Widget build(BuildContext context) {
    final _screenSize = screenSize(context);
    final _height = _screenSize.height - appBarHeight - footerHeight;

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Center(
            child: SizedBox(
              width: isSmallScreen(context)
                  ? _screenSize.width * 0.7
                  : _screenSize.width * 0.4,
              child: Card(
                color: Theme.of(context).primaryColor,
                // margin: EdgeInsets.symmetric(
                //     vertical: 20,
                //     horizontal: _isSmallScreen ? paddingSmall : paddingLarge),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                            ),
                          ),
                          TextFormField(
                            cursorColor: Theme.of(context).accentColor,
                            style: Theme.of(context).textTheme.bodyText1,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              labelStyle: Theme.of(context).textTheme.bodyText1,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter username';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _userName = value;
                            },
                          ),
                          TextFormField(
                            cursorColor: Theme.of(context).accentColor,
                            style: Theme.of(context).textTheme.bodyText1,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: Theme.of(context).textTheme.bodyText1,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                            obscureText: true,
                            onSaved: (value) {
                              _userPassword = value;
                            },
                          ),
                          SizedBox(height: 20),
                          AkButton(
                            onPressed: _trySubmit,
                            child: Text(
                              'Login',
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
          ),
        ),
        _height < 0 ? Container() : Footer(),
      ],
    );
  }
}
