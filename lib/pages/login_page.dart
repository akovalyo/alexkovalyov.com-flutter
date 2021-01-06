import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import 'package:mysite/consts/consts.dart';
import 'package:mysite/consts/routes.dart';
import 'package:mysite/helpers.dart';
import 'package:mysite/consts/routes.dart';
import 'package:mysite/page_elements/footer.dart';
import 'package:mysite/widgets/button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  var _userEmail = '';
  var _userPassword = '';
  var _isLoading = false;

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();

      _authenticate(
        _userEmail.trim(),
        _userPassword.trim(),
      );
    }
  }

  void _authenticate(String username, String password) async {
    try {
      setState(() {
        _isLoading = true;
      });

      await _auth.signInWithEmailAndPassword(
          email: _userEmail, password: _userPassword);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Welcome!'),
          backgroundColor: Colors.green[600].withOpacity(0.7),
        ),
      );
      navKey.currentState.pushNamed(routeHome);
    } catch (error) {
      var message = 'An error occured, please check your credentialas!';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor.withOpacity(0.7),
        ),
      );
      print(error.message);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _height = _screenSize.height - appBarHeight - footerHeight;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: _screenSize.height,
      ),
      child: IntrinsicHeight(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
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
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  cursorColor: Theme.of(context).accentColor,
                                  keyboardType: TextInputType.emailAddress,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    labelStyle:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter email';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _userEmail = value;
                                  },
                                ),
                                TextFormField(
                                  cursorColor: Theme.of(context).accentColor,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    labelStyle:
                                        Theme.of(context).textTheme.bodyText1,
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
                                _isLoading
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : AkButton(
                                        onPressed: _trySubmit,
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
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
          ),
        ),
      ),
    );

    // Column(
    //   mainAxisSize: MainAxisSize.max,
    //   children: [
    //     Expanded(
    //       child: Center(
    //         child: SizedBox(
    //           width: isSmallScreen(context)
    //               ? _screenSize.width * 0.7
    //               : _screenSize.width * 0.4,
    //           child: Card(
    //             color: Theme.of(context).primaryColor,
    //             // margin: EdgeInsets.symmetric(
    //             //     vertical: 20,
    //             //     horizontal: _isSmallScreen ? paddingSmall : paddingLarge),
    //             child: SingleChildScrollView(
    //               child: Padding(
    //                 padding: const EdgeInsets.all(20),
    //                 child: Form(
    //                   key: _formKey,
    //                   child: Column(
    //                     mainAxisSize: MainAxisSize.min,
    //                     children: <Widget>[
    //                       Padding(
    //                         padding: const EdgeInsets.symmetric(vertical: 20),
    //                         child: Text(
    //                           'Login',
    //                           style: TextStyle(
    //                             fontSize: 32,
    //                             fontWeight: FontWeight.bold,
    //                             color: Theme.of(context).secondaryHeaderColor,
    //                           ),
    //                         ),
    //                       ),
    //                       TextFormField(
    //                         cursorColor: Theme.of(context).accentColor,
    //                         keyboardType: TextInputType.emailAddress,
    //                         style: Theme.of(context).textTheme.bodyText1,
    //                         decoration: InputDecoration(
    //                           labelText: 'Email',
    //                           labelStyle: Theme.of(context).textTheme.bodyText1,
    //                         ),
    //                         validator: (value) {
    //                           if (value.isEmpty) {
    //                             return 'Please enter email';
    //                           }
    //                           return null;
    //                         },
    //                         onSaved: (value) {
    //                           _userEmail = value;
    //                         },
    //                       ),
    //                       TextFormField(
    //                         cursorColor: Theme.of(context).accentColor,
    //                         style: Theme.of(context).textTheme.bodyText1,
    //                         decoration: InputDecoration(
    //                           labelText: 'Password',
    //                           labelStyle: Theme.of(context).textTheme.bodyText1,
    //                         ),
    //                         validator: (value) {
    //                           if (value.isEmpty) {
    //                             return 'Please enter password';
    //                           }
    //                           return null;
    //                         },
    //                         obscureText: true,
    //                         onSaved: (value) {
    //                           _userPassword = value;
    //                         },
    //                       ),
    //                       SizedBox(height: 20),
    //                       _isLoading
    //                           ? CircularProgressIndicator()
    //                           : AkButton(
    //                               onPressed: _trySubmit,
    //                               child: Text(
    //                                 'Login',
    //                                 style: TextStyle(
    //                                   fontSize: 20,
    //                                 ),
    //                               ),
    //                               backgroundColor:
    //                                   Theme.of(context).primaryColor,
    //                             ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //     _height < 0 ? Container() : Footer(),
    //   ],
    // );
  }
}
