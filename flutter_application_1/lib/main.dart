import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/details/new_details_screen.dart';
import 'package:flutter_application_1/pages/home/home_screen.dart';
import 'package:flutter_application_1/pages/splash/splash_screen.dart';
import 'package:flutter_application_1/share/cores/newtwork_layer/my_provider.dart';
import 'package:flutter_application_1/share/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(), child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return  MaterialApp(
      locale: Locale(provider.localeProvider),

      localizationsDelegates:const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,

      title: 'News ',
      theme: ApplicationTheme.themeLight,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName : (context)=>SplashScreen(),
        HomeScreen.routeName: (context)=>HomeScreen(),
        NewsDetailsScreen.routeName:(context) => NewsDetailsScreen(),
      },
    );
  }
}
