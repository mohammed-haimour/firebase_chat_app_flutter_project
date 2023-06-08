import 'package:firebase_chat_app/core/utils/themes.dart';
import 'package:firebase_chat_app/features/welcome/presentation/views/weclome_to_app_view.dart';
import 'package:firebase_chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // var isSingedIn = FirebaseAuth.instance.currentUser;

  // if (isSingedIn == null) {
  //   isSingedIn = false;
  // } else {
  //   isSingedIn = true;
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Chat App',

      theme: lightTheme(),

      darkTheme: darkTheme(),

      // selecting Theme
      themeMode: ThemeMode.dark,

      home: const WelcomeToAppView(),
    );
  }
}
