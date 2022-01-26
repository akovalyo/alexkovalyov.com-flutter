import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:dynamic_themes/dynamic_themes.dart';

import 'models/app_state.dart';
import 'theme/theme.dart';
import 'navigation/routes.dart';
import 'navigation/route_generator.dart';
import 'models/nft_collection.dart';

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
    appState.checkAuth();
    final themeCollection = ThemeCollection(
      themes: {
        AppThemes.light: AppThemes.themeDataLight(),
        AppThemes.dark: AppThemes.themeDataDark(),
        AppThemes.theme2077: AppThemes.themeData2077(),
      },
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => appState),
        ChangeNotifierProvider(create: (_) => NftCollection()),
      ],
      child: DynamicTheme(
        themeCollection: themeCollection,
        defaultThemeId: AppThemes.light,
        builder: (context, theme) => MaterialApp(
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
