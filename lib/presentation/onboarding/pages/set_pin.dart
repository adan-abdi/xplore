import 'package:flutter/material.dart';

class SetPinPage extends StatefulWidget {
  const SetPinPage({Key? key}) : super(key: key);

  @override
  _SetPinPageState createState() => _SetPinPageState();
}

class _SetPinPageState extends State<SetPinPage> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final TextEditingController _initialPINController = TextEditingController();
  // final TextEditingController _confirmPINController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView()),
    );
  }
}
