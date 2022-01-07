import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../consts/consts.dart';
import '../navigation/routes.dart';
import '../helpers.dart';
import '../page_elements/footer.dart';
import '../widgets/button.dart';
import '../appState.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  var userEmail = '';
  var userPassword = '';
  // var _isLoading = false;

  void trySubmit(AppState appState, BuildContext context) {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      formKey.currentState!.save();
      appState.authenticate(userEmail.trim(), userPassword.trim(), context);
    }
  }

  // void _authenticate(String username, String password) async {
  //   try {
  //     setState(() {
  //       _isLoading = true;
  //     });

  //     await _auth.signInWithEmailAndPassword(
  //         email: _userEmail, password: _userPassword);

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Welcome!'),
  //         backgroundColor: Colors.green[600]!.withOpacity(0.7),
  //       ),
  //     );
  //     navKey.currentState!.pushNamed(Routes.home.path);
  //   } catch (error) {
  //     var message = 'An error occured, please check your credentialas!';
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(message),
  //         backgroundColor: Theme.of(context).errorColor.withOpacity(0.7),
  //       ),
  //     );
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final height = screenSize.height - appBarHeight - footerHeight;
    AppState appState = Provider.of<AppState>(context);

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: screenSize.height,
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
                        ? screenSize.width * 0.7
                        : screenSize.width * 0.4,
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Form(
                            key: formKey,
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
                                  cursorColor:
                                      Theme.of(context).colorScheme.secondary,
                                  keyboardType: TextInputType.emailAddress,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    labelStyle:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter email';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userEmail = value!;
                                  },
                                ),
                                TextFormField(
                                  cursorColor:
                                      Theme.of(context).colorScheme.secondary,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    labelStyle:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter password';
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  onSaved: (value) {
                                    userPassword = value!;
                                  },
                                ),
                                SizedBox(height: 20),
                                appState.isLoading
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : AkButton(
                                        onPressed: () =>
                                            trySubmit(appState, context),
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
              height < 0 ? Container() : Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
