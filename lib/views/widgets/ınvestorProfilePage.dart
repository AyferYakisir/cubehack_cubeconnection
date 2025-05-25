import 'package:flutter/material.dart';

class InvestorProfilePage extends StatelessWidget {
  const InvestorProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F0F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F0F0),
        elevation: 0,
        title: const Text('Yatırımcı Profili'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Yatırım Aralığı'),
            SizedBox(height: 8),
            TextField(decoration: InputDecoration(fillColor: Colors.white, filled: true)),
            SizedBox(height: 16),
            Text('İlgi Duyulan Sektör'),
            SizedBox(height: 8),
            TextField(decoration: InputDecoration(fillColor: Colors.white, filled: true)),
            SizedBox(height: 16),
            Text('Firma İsmi'),
            SizedBox(height: 8),
            TextField(decoration: InputDecoration(fillColor: Colors.white, filled: true)),
            SizedBox(height: 16),
            Text('LinkedIn / Website'),
            SizedBox(height: 8),
            TextField(decoration: InputDecoration(fillColor: Colors.white, filled: true)),
          ],
        ),
      ),
    );
  }
}