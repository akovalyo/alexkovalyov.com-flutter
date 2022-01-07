import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'appState.dart';
import 'theme/theme.dart';
import 'theme/dynamic_theme.dart';
import 'navigation/routes.dart';
import 'navigation/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  final AppState appState = AppState();
  await appState.firebaseInit();
  await appState.loadPosts();
  runApp(MyApp(appState));
}

class MyApp extends StatelessWidget {
  final AppState appState;
  MyApp(this.appState);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: appState),
      ],
      child: DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => akTheme(brightness, null),
        themedWidgetBuilder: (context, theme) => MaterialApp(
          title: 'Alex Kovalyov',
          debugShowCheckedModeBanner: false,
          theme: theme,
          initialRoute: null,
          navigatorKey: navKey,
          onGenerateRoute: generateRoute,
        ),
      ),
    );
  }
}
