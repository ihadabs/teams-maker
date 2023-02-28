import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:teams_maker/pages/home_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teams Maker',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const HomePage(),
    );
  }
}
