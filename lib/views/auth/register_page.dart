import 'package:cubeincubation_mobile_hackathon_2025/blocs/auth/register/register_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String selectedRole = 'Girişimci';
  String selectedDropdownValue = 'Seçenek 1';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController customField1Controller = TextEditingController();

  bool isKVKKChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F0F0),
      body: SafeArea(
        child: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Kayıt başarılı! E-postanızı doğrulayın.')),
              );
            } else if (state is RegisterFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'Hesabınızı Oluşturun',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildRoleSelector(),
                  const SizedBox(height: 20),
                  _buildTextField('İSİM-SOYİSİM', nameController),
                  _buildTextField('E-MAIL', emailController),
                  _buildTextField('ŞİFRE', passwordController, obscure: true),
                  if (selectedRole == 'Girişimci') ...[
                    _buildTextField('START-UP ADI', customField1Controller),
                    _buildDropdown('START-UP AŞAMASI'),
                  ] else if (selectedRole == 'Yatırımcı') ...[
                    _buildTextField('YATIRIM ARALIĞI', customField1Controller),
                    _buildDropdown('İLGİ DUYULAN SEKTÖR'),
                  ] else if (selectedRole == 'Mentör') ...[
                    _buildTextField('UZMANLIK ALANI', customField1Controller),
                    _buildDropdown('MENTÖRLÜK TECRÜBESİ'),
                  ],
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                        value: isKVKKChecked,
                        onChanged: (value) {
                          setState(() {
                            isKVKKChecked = value!;
                          });
                        },
                      ),
                      const Expanded(
                        child: Text('KVKK Metnini Okudum ve Onaylıyorum'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: state is RegisterLoading || !isKVKKChecked
                        ? null
                        : () {
                            context.read<RegisterBloc>().add(RegisterSubmitted(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  role: selectedRole,
                                  field1: customField1Controller.text,
                                  dropdownValue: selectedDropdownValue,
                                ));
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0E1D33),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: state is RegisterLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text('KAYIT OLUN', style: TextStyle(fontSize: 16)),
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: const [
                      Image(image: AssetImage('assets/images/logo.png'), height: 50),
                      SizedBox(height: 8),
                      Text.rich(
                        TextSpan(
                          text: 'Hesabınız var mı? ',
                          children: [
                            TextSpan(
                              text: 'Giriş Yapın',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildRoleSelector() {
    final roles = ['Girişimci', 'Yatırımcı', 'Mentör'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: roles.map((role) {
        final isSelected = role == selectedRole;
        return GestureDetector(
          onTap: () => setState(() => selectedRole = role),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? Colors.grey.shade300 : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(role),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool obscure = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

Widget _buildDropdown(String label) {
  final options = ['Başlangıç', 'Orta', 'İleri'];
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
        const SizedBox(height: 15),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: DropdownButtonFormField<String>(
          value: options.contains(selectedDropdownValue) ? selectedDropdownValue : null,
          items: options
              .map((e) => DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                selectedDropdownValue = value;
              });
            }
          },
          decoration: const InputDecoration(
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ),
    ],
  );
}

}