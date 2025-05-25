import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EntrepreneurProfilePage extends StatefulWidget {
  const EntrepreneurProfilePage({super.key});

  @override
  State<EntrepreneurProfilePage> createState() => _EntrepreneurProfilePageState();
}

class _EntrepreneurProfilePageState extends State<EntrepreneurProfilePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController startupNameController = TextEditingController();
  final TextEditingController projectDescController = TextEditingController();

  String? startupStage;
  String? sector;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final uid = auth.currentUser!.uid;

    // users koleksiyonundan sadece isim ve email al
    final userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final userData = userDoc.data();
    if (userData != null) {
      nameController.text = userData['name'] ?? '';
      emailController.text = userData['email'] ?? '';
    }

    // entrepreneurs koleksiyonundan diğer bilgileri al
    final entrepreneurDoc = await FirebaseFirestore.instance.collection('entrepreneurs').doc(uid).get();
    final entrepreneurData = entrepreneurDoc.data();
    if (entrepreneurData != null) {
      passwordController.text = entrepreneurData['password'] ?? '';
      startupNameController.text = entrepreneurData['startupName'] ?? '';
      startupStage = entrepreneurData['startupStage'];
      sector = entrepreneurData['sector'];
      projectDescController.text = entrepreneurData['projectDescription'] ?? '';
    }

    setState(() {});
  }

  Future<void> _saveProfile() async {
    final uid = auth.currentUser!.uid;

    // users koleksiyonuna sadece isim ve email kaydet
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'name': nameController.text,
      'email': emailController.text,
    }, SetOptions(merge: true));

    // entrepreneurs koleksiyonuna diğer bilgileri kaydet
    await FirebaseFirestore.instance.collection('entrepreneurs').doc(uid).set({
      'password': passwordController.text,
      'startupName': startupNameController.text,
      'startupStage': startupStage,
      'sector': sector,
      'projectDescription': projectDescController.text,
    }, SetOptions(merge: true));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Bilgiler güncellendi')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F0F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F0F0),
        elevation: 0,
        title: const Text('Girişimci Profili'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const CircleAvatar(
              radius: 48,
              backgroundColor: Colors.grey,
              child: Icon(Icons.camera_alt, size: 32),
            ),
            const SizedBox(height: 24),
            _buildLabeledField('İSİM-SOYİSİM', nameController),
            _buildLabeledField('E-MAIL', emailController),
            _buildLabeledField('ŞİFRE', passwordController),
            _buildLabeledField('START-UP ADI', startupNameController),
            _buildDropdownField('START-UP AŞAMASI', ['Fikir', 'MVP', 'Büyüme', 'Yatırım'], startupStage, (val) => setState(() => startupStage = val)),
            _buildDropdownField('SEKTÖR', ['Teknoloji', 'Sağlık', 'Eğitim', 'Finans'], sector, (val) => setState(() => sector = val)),
            const SizedBox(height: 16),
            const Text('PROJE AÇIKLAMASI'),
            const SizedBox(height: 8),
            TextField(
              controller: projectDescController,
              maxLines: 4,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _saveProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF213448),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                'KAYDET',
                style: TextStyle(letterSpacing: 1.5, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabeledField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDropdownField(String label, List<String> items, String? value, ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          ),
          items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
          onChanged: onChanged,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
