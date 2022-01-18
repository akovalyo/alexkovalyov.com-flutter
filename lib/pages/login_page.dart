import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts/consts.dart';
import '../helpers/screen_helper.dart';
import '../page_elements/footer.dart';
import '../widgets/ak_button.dart';
import '../models/app_state.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  var userEmail = '';
  var userPassword = '';

  void trySubmit(AppState appState, BuildContext context) {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      formKey.currentState!.save();
      appState.authenticate(userEmail.trim(), userPassword.trim(), context);
    }
  }

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
                    width: ScreenHelper.isSmallScreen(context)
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
