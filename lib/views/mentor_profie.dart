import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController field1Controller = TextEditingController();
  final TextEditingController field2Controller = TextEditingController();
  final TextEditingController field3Controller = TextEditingController();
  final TextEditingController field4Controller = TextEditingController();
  final TextEditingController field5Controller = TextEditingController();

  String currentRole = '';
  String userName = 'Cubeconnect';
  String? mentorshipExperience;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;
      final snapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      final data = snapshot.data();

      if (data != null) {
        nameController.text = data['name'] ?? '';
        emailController.text = data['email'] ?? '';
        currentRole = data['role'] ?? '';
        userName = data['name'] ?? 'Cubeconnect';
        setState(() {});
      }
    } catch (e) {
      debugPrint('Kullanıcı verileri alınamadı: $e');
    }
  }

  Future<void> saveProfile() async {
    if (_formKey.currentState!.validate()) {
      await FirebaseFirestore.instance.collection(currentRole.toLowerCase() + 's').add({
        'name': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'field1': field1Controller.text,
        'field2': field2Controller.text,
        'field3': field3Controller.text,
        'field4': field4Controller.text,
        'field5': field5Controller.text,
        'mentorshipExperience': mentorshipExperience,
        'createdAt': Timestamp.now(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profil başarıyla kaydedildi')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F0F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F0F0),
        elevation: 0,
        title: Text(
          'Hoşgeldiniz,\n$userName',
          style: const TextStyle(color: Colors.black87, fontSize: 18),
        ),
      ),
      body: currentRole.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  const CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.camera_alt, size: 32),
                  ),
                  const SizedBox(height: 24),

                  buildInput('İsim-Soyisim', nameController),
                  buildInput('E-mail', emailController),
                  buildInput('Şifre', passwordController, obscureText: true),

                  if (currentRole == 'Mentor') ...[
                    buildInput('Uzmanlık Alanı', field1Controller),
                    DropdownButtonFormField<String>(
                      value: mentorshipExperience,
                      items: const [
                        DropdownMenuItem(value: 'Yok', child: Text('Yok')),
                        DropdownMenuItem(value: '1-3 Yıl', child: Text('1-3 Yıl')),
                        DropdownMenuItem(value: '3+ Yıl', child: Text('3+ Yıl')),
                      ],
                      onChanged: (value) => setState(() => mentorshipExperience = value),
                      decoration: const InputDecoration(
                        labelText: 'Mentörlük Tecrübesi',
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      ),
                    ),
                    const SizedBox(height: 16),
                    buildInput('LinkedIn / Website', field2Controller),
                    buildInput('Boş Zaman Dilimi', field3Controller),
                    buildInput('Hedef Kitle', field4Controller),
                    buildInput('Mentörlük Deneyiminden Bahsedin', field5Controller, maxLines: 4),
                  ] else if (currentRole == 'Girisimci') ...[
                    buildInput('Proje Alanı', field1Controller),
                    buildInput('Proje Açıklaması', field2Controller),
                    buildInput('Beklenen Yatırım Tutarı', field3Controller),
                    buildInput('LinkedIn / Website', field4Controller),
                  ] else if (currentRole == 'Yatirimci') ...[
                    buildInput('İlgi Duyulan Sektör', field1Controller),
                    buildInput('Yatırım Aralığı', field2Controller),
                    buildInput('Firma İsmi', field3Controller),
                    buildInput('LinkedIn / Website', field4Controller),
                  ],

                  const SizedBox(height: 24),

                  ElevatedButton(
                    onPressed: saveProfile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1D283A),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'KAYDET',
                      style: TextStyle(letterSpacing: 1.5),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget buildInput(
    String label,
    TextEditingController controller, {
    bool obscureText = false,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        maxLines: maxLines,
        validator: (value) => value!.isEmpty ? '$label boş olamaz' : null,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
