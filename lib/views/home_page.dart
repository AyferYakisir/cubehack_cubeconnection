import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/home/home_bloc.dart';
import '../../../blocs/home/home_event.dart';
import '../../../blocs/home/home_state.dart';
import '../../../controllers/home_controller.dart';
import '../../../models/initiative_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Set<InitiativeModel> favoriteItems = {};

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xFFF6F0F0);

    return BlocProvider(
      create: (_) => HomeBloc(HomeController())..add(LoadInitiatives()),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          title: const Text(
            'Hoşgeldiniz,\nCubeconnect',
            style: TextStyle(color: Colors.black87, fontSize: 18),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite_border, color: Colors.black),
              onPressed: () {
                // Favoriler listesi ekranda gösterilebilir veya yeni sayfaya yönlendirme yapılabilir
                showModalBottomSheet(
                  context: context,
                  builder: (_) => ListView(
                    padding: const EdgeInsets.all(16),
                    children: favoriteItems.isEmpty
                        ? [const Center(child: Text('Henüz favori yok'))]
                        : favoriteItems
                              .map((item) => ListTile(title: Text(item.title)))
                              .toList(),
                  ),
                );
              },
            ),
            const SizedBox(width: 16),
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) => Container(
                    padding: const EdgeInsets.all(16),
                    height: 200,
                    child: const Center(
                      child: Text(
                        'Henüz bildirim yok.',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(width: 16),
            const Icon(Icons.person_outline, color: Colors.black),
            const SizedBox(width: 12),
          ],
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoaded) {
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const Text(
                    'En Popüler Girişimler',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 170,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.popular.length,
                      itemBuilder: (_, index) =>
                          _buildCard(state.popular[index]),
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Son Gelen Girişimciler',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Tümünü Gör',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ...state.recent.map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _buildCard(item),
                    ),
                  ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: backgroundColor,
          color: const Color(0xFF213448),
          height: 60,
          index: 1,
          animationDuration: const Duration(milliseconds: 300),
          items: const [
            Icon(Icons.people, color: Colors.white, size: 26),
            Icon(Icons.home, color: Colors.white, size: 30),
            Icon(Icons.shopping_bag, color: Colors.white, size: 26),
            Icon(Icons.chat_bubble_outline, color: Colors.white, size: 26),
          ],
          onTap: (index) {
            // Sayfa geçişleri yapılabilir
          },
        ),
      ),
    );
  }

  Widget _buildCard(InitiativeModel item) {
    final isFavorite = favoriteItems.contains(item);

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          // Geçici boş kutu
          Container(
            width: 250,
            height: 150,
            color: const Color(0xFFE0E0E0),
            alignment: Alignment.center,
            child: Text(
              item.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Tıklanabilir favori ikonu
          Positioned(
            right: 10,
            top: 10,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (isFavorite) {
                    favoriteItems.remove(item);
                  } else {
                    favoriteItems.add(item);
                  }
                });
              },
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.redAccent : Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF547792),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Detayları gör',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
