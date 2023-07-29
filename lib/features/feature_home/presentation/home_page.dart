import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XploreColors.white,
      body: SafeArea(child: Text("Hello")),
    );
  }
}
