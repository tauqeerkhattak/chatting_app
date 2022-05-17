import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatting/providers/splash_provider.dart';
import 'package:flutter_chatting/screens/splash/splash.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FlutterChatting());
}

class FlutterChatting extends StatelessWidget {
  const FlutterChatting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SplashProvider>(
      create: (context) => SplashProvider(),
      child: const MaterialApp(
        home: Splash(),
      ),
    );
  }
}
