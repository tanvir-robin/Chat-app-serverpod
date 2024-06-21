import 'package:chat_app_serverpod_flutter/functions/initialize_auth.dart';
import 'package:chat_app_serverpod_flutter/screens/account_page.dart';
import 'package:chat_app_serverpod_flutter/screens/chat_screen.dart';
import 'package:chat_app_serverpod_flutter/screens/sign_in_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    sessionManager.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Current status of signin ${sessionManager.isSignedIn}');
    return Scaffold(
      // body: ChatScreen(),
      body: sessionManager.isSignedIn ? AccountPage() : const SignInPage(),
    );
  }
}
