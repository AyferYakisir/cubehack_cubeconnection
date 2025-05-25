import 'package:flutter/material.dart';

class MyInitiativesPage extends StatelessWidget {
  const MyInitiativesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Girişimlerim')),
      body: const Center(
        child: Text('This is the entrepreneur initiatives page.'),
      ),
    );
  }
}
