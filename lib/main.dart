import 'package:flutter/material.dart';
import 'package:game_score/notifiers/datasource_notifier.dart';
import 'package:game_score/notifiers/user_notifier.dart';
import 'package:game_score/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserNotifier()),
        ChangeNotifierProvider(create: (_) => DataSourceNotifier()),
      ],
      child: MaterialApp(
        title: 'Game Score',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        home: const HomePage(),
      ),
    );
  }
}
