import 'package:flutter/material.dart';
import 'package:rcda_012_tp_flutter/app-theme.dart';
import 'package:rcda_012_tp_flutter/auth/auth-page.dart';
import 'package:rcda_012_tp_flutter/home/home-page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: AppTheme.appBarTheme,

      ),
      initialRoute: "/",
      routes: {
        "/" : (context) => AuthPage(),
        "/messages" : (context) => MyHomePage()
      },
    );
  }
}