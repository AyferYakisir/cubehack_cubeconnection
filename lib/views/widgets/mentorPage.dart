// lib/views/profile_page.dart (Mentor)
import 'package:flutter/material.dart';

class Mentorpage extends StatelessWidget {
  const Mentorpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F0F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F0F0),
        elevation: 0,
        title: const Text('Mentor Profili'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Uzmanlık Alanı'),
            SizedBox(height: 8),
            TextField(decoration: InputDecoration(fillColor: Colors.white, filled: true)),
            SizedBox(height: 16),
            Text('Mentörlük Tecrübesi'),
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
