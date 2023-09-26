import 'package:flutter/material.dart';
import 'package:untitled2/home_screen.dart';
import 'package:untitled2/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/providers/app_config_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.themeLight,
      darkTheme: MyTheme.themeDark,
      themeMode: provider.appMode,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
