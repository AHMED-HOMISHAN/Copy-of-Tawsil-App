import 'package:flutter/material.dart';
import 'package:tawsil/components/consts.dart';
import 'package:tawsil/screens/homeScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'توصيل',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                elevation: 10,
                showUnselectedLabels: false,
                backgroundColor: Colors.white,
                selectedItemColor: ColorTheme.primaryColor,
                unselectedItemColor: Colors.grey),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            colorScheme:
                ColorScheme.fromSeed(seedColor: ColorTheme.primaryColor),
            useMaterial3: true,
            primaryColor: ColorTheme.primaryColor,
            indicatorColor: ColorTheme.primaryColor,
            appBarTheme: const AppBarTheme(color: Colors.white),
            scaffoldBackgroundColor: ColorTheme.scaffoldColor),
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale("ar", "AE")],
        locale: const Locale("ar", "AE"),
        home: Directionality(
          textDirection: TextDirection.rtl,
          child: HomeScreen(),
        ));
  }
}
