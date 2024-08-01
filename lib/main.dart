import 'package:flutter/material.dart';
import 'package:rcda_012_tp_flutter/app-theme.dart';
import 'package:rcda_012_tp_flutter/auth-page.dart';
import 'package:rcda_012_tp_flutter/footer.dart';
import 'package:rcda_012_tp_flutter/header.dart';
import 'package:rcda_012_tp_flutter/home-page.dart';
import 'package:rcda_012_tp_flutter/message-card.dart';

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
      initialRoute: "/messages",
      routes: {
        "/" : (context) => AuthPage(),
        "/messages" : (context) => MyHomePage()
      },
    );
  }
}