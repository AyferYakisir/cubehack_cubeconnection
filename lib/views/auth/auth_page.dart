import 'package:cubeincubation_mobile_hackathon_2025/views/auth/login_page.dart';
import 'package:cubeincubation_mobile_hackathon_2025/views/auth/register_page.dart';
import 'package:flutter/material.dart';

class LoginRegisterScreen extends StatelessWidget {
  const LoginRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Üstteki küp görseli
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.35,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/images/bk_image.png', 
              ),
            ),
          ),

          // Alttaki yarı yuvarlak alan (butonlar ve metin)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              decoration: const BoxDecoration(
                color: Color(0xFFF6F0F0),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                  
                  ),
                  const SizedBox(height: 32),

                  // Giriş Yap butonu
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.login_rounded, size: 24),
                    label: const Text(
                      'Giriş Yap',
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB1CBD3),
                      foregroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Kayıt Ol butonu
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.person_add_alt, size: 24),
                    label: const Text(
                      'Kayıt Ol',
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB1CBD3),
                      foregroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Gizlilik metni
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Devam ettiğiniz takdirde ',
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                      children: const [
                        TextSpan(
                          text: 'gizlilik koşullarını',
                          style: TextStyle(
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: ' onaylamış olursunuz.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
