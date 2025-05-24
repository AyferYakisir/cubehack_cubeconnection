import 'package:flutter/material.dart';
import '../../models/initiative_model.dart';

void showInitiativeDetailModal(BuildContext context, InitiativeModel item) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return DraggableScrollableSheet(
        initialChildSize: 0.95,
        maxChildSize: 0.95,
        builder: (_, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      child: Image.asset(
                        'assets/images/background2.jpeg',
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 16,
                      left: 16,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: Text(
                      "Proje Adı", // Proje adı burada
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 300,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const SingleChildScrollView(
                      child: Text(
                        "A Teknoloji, 2022 yılında İstanbul'da kurulan, yapay zeka destekli sistemler ve akıllı çözümler geliştiren yenilikçi bir girişim firmasıdır.\n\n"
                        "Amacımız; lojistik, enerji yönetimi ve akıllı altyapı alanlarında verimliliği artırmak, insan odaklı tasarım anlayışıyla dijital dönüşümü hızlandırmaktır.\n\n"
                        "Yeni çıkardığımız EnerScope adlı SaaS platformu, enerji tesislerinin izlenmesi, optimize edilmesi ve veri odaklı yapay zeka araçları ile desteklenmesini sağlar.\n\n"
                        "Biz A Teknoloji olarak geleceğin sadece yeni teknolojilerle değil, akılcı ve etik çözümlerle şekillendiğine inanıyoruz.",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Image.asset('assets/images/icon.png', height: 40),
                      const Spacer(),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.send, color: Colors.white),
                        label: const Text('Etkileşim Kur'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB6E8C8),
                          foregroundColor: Colors.black87,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        },
      );
    },
  );
}
