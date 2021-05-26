import 'package:flutter/material.dart';
import 'package:machine_round/meta/view/screens/bottomTabsPage/bottomTabsPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Machine Round',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: BottomTabsPage(),
    );
  }
}
