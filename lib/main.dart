import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:instagram_clone/consts/colors_.dart';
import 'package:instagram_clone/provider/auth_provider.dart';
import 'package:instagram_clone/screens/WelcomeScreen/welcomescreen.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getCountryCode();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
    child: const MyApp(),
  ));
}

getCountryCode() async {
  try {
    http.Response res = await http.get(Uri.parse('http://ip-api.com/json'));
    Map data = jsonDecode(res.body);
    countryCode = data['countryCode'];
    print(countryCode);
  } catch (e) {
    //
    print(e);
  }
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
