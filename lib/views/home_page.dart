import 'package:cubeincubation_mobile_hackathon_2025/blocs/blocs/home/home_bloc.dart';
import 'package:cubeincubation_mobile_hackathon_2025/blocs/blocs/home/home_event.dart';
import 'package:cubeincubation_mobile_hackathon_2025/blocs/blocs/home/home_state.dart';
import 'package:cubeincubation_mobile_hackathon_2025/blocs/blocs/messages/messages_bloc.dart';
import 'package:cubeincubation_mobile_hackathon_2025/views/investor_page.dart';
import 'package:cubeincubation_mobile_hackathon_2025/views/meetings_page.dart';
import 'package:cubeincubation_mobile_hackathon_2025/views/messages_list_page.dart';
import 'package:cubeincubation_mobile_hackathon_2025/views/messages_page.dart';
import 'package:cubeincubation_mobile_hackathon_2025/views/modals.dart/initiative_detail_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../../controllers/home_controller.dart';
import '../../../models/initiative_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Set<InitiativeModel> favoriteItems = {};
  int selectedIndex = 1;
  final String userType = 'investor';

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xFFF6F0F0);

    final List<Widget> pages = [
      const MeetingsPage(),
      _buildHomeBody(),
      const InvestorPage(),
      const MessagesListPage(),
    ];

    return BlocProvider(
      create: (_) => HomeBloc(HomeController())..add(LoadInitiatives()),
      child: Scaffold(
        backgroundColor: backgroundColor,

        appBar: selectedIndex != 3
            ? AppBar(
                backgroundColor: backgroundColor,
                elevation: 0,
                title: const Text(
                  'Hoşgeldiniz Cubeconnect',
                  style: TextStyle(color: Colors.black87, fontSize: 18),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => ListView(
                          padding: const EdgeInsets.all(16),
                          children: favoriteItems.isEmpty
                              ? [const Center(child: Text('Henüz favori yok'))]
                              : favoriteItems
                                    .map(
                                      (item) =>
                                          ListTile(title: Text(item.title)),
                                    )
                                    .toList(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications_none,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => Container(
                          padding: const EdgeInsets.all(16),
                          height: 200,
                          child: const Center(
                            child: Text(
                              'Henüz bildirim yok.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 12),
                  const Icon(Icons.person_outline, color: Colors.black),
                  const SizedBox(width: 12),
                ],
              )
            : null,

        body: pages[selectedIndex],

        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: backgroundColor,
          color: const Color(0xFF213448),
          height: 60,
          index: selectedIndex,
          animationDuration: const Duration(milliseconds: 300),
          items: const [
            Icon(Icons.people, color: Colors.white, size: 26),
            Icon(Icons.home, color: Colors.white, size: 30),
            Icon(Icons.shopping_bag, color: Colors.white, size: 26),
            Icon(Icons.chat_bubble_outline, color: Colors.white, size: 26),
          ],
          onTap: (index) => setState(() => selectedIndex = index),
        ),
      ),
    );
  }

  Widget _buildHomeBody() {
    return BlocBuilder<HomeBloc, HomeState>(
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
                      _buildCard(context, state.popular[index]),
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
                  Text('Tümünü Gör', style: TextStyle(color: Colors.black54)),
                ],
              ),
              const SizedBox(height: 8),
              ...state.recent.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _buildCard(context, item),
                ),
              ),
            ],
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildCard(BuildContext context, InitiativeModel item) {
    final isFavorite = favoriteItems.contains(item);

    return GestureDetector(
      onTap: () => showInitiativeDetailModal(context, item),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // Eğer asset yol tanımlıysa görsel göster, yoksa yedek kutu
            item.imageUrl.isNotEmpty
                ? Image.asset(
                    item.imageUrl,
                    width: 250,
                    height: 150,
                    fit: BoxFit.cover,
                  )
                : Container(
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

            // Kalp ikonu
            Positioned(
              top: 10,
              right: 10,
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
                  color: isFavorite ? Colors.red : Colors.white,
                ),
              ),
            ),

            // Detayları gör butonu
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
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
      ),
    );
  }
}
