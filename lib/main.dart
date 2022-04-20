import 'package:flutter/material.dart';
import 'package:instagram_clone/provider/auth_provider.dart';
import 'package:instagram_clone/screens/WelcomeScreen/WelcomeScreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WelcomeScreen(),
      title: "Instagram",
    );
  }
}
