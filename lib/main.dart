import 'package:flutter/material.dart';

//importaciones de firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//pages
import 'pages/edit_name.dart';
import 'pages/home_page.dart';
import 'pages/add_name.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': ((context) => const Home()),
        '/add': ((context) => const AddNamePage()),
        '/edit': ((context) => const EditNamePage()),
      },
    );
  }
}
