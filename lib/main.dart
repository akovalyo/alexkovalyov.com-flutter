import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:dynamic_themes/dynamic_themes.dart';

import 'models/app_state.dart';
import 'theme/theme.dart';
import 'navigation/routes.dart';
import 'navigation/route_generator.dart';
import 'models/nft_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  final AppState appState = AppState();
  final NftManager nftManager = NftManager();
  await appState.firebaseInit();
  await appState.loadPosts();
  await nftManager.load();
  runApp(MyApp(appState, nftManager));
}

class MyApp extends StatelessWidget {
  final AppState appState;
  final NftManager nftManager;
  MyApp(this.appState, this.nftManager);

  @override
  Widget build(BuildContext context) {
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
        ChangeNotifierProvider(create: (_) => nftManager),
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
