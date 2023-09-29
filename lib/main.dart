// ignore_for_file: unused_field, unused_import, no_leading_underscores_for_local_identifiers
import 'package:intertrack/features/app/presentation/pages/home_page.dart';
import 'package:intertrack/features/app/presentation/pages/user_page.dart';
import 'package:intertrack/features/app/presentation/screens/speech_screen.dart';
import 'features/app/presentation/pages/login_page.dart';
import 'package:intertrack/services/notificacion.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC0ofIuDy10JuM7MgZdNYFOHAn5Yv6PEOo",
            appId: "1:352398970381:web:d17c6da36735b98d17cf44",
            messagingSenderId: "352398970381",
            projectId: "intertrack-fb"));
  }
  await Firebase.initializeApp();
  await initNotifications();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  //const MyApp({Key? key}) : super(key: key);
  // Actual index page
  int _actualPage = 0;
  // Pages list
  final List<Widget> _pages = [
    // Widgets to load
    HomePage(),
    UserPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Intertrack',
      home: Scaffold(
          drawer: Drawer(
            child: LoginPage(),
          ),
          appBar: AppBar(
            title: Text("Intertrack GPS app"),
          ),
          body: _pages[_actualPage],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                _actualPage = index;
              });
            },
            currentIndex: _actualPage,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.supervised_user_circle), label: "Users")
            ],
          )),
    );
  }
}
