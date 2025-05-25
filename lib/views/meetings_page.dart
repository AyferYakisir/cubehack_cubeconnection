import 'package:cubeincubation_mobile_hackathon_2025/blocs/blocs/meeting/meeting_bloc.dart';
import 'package:cubeincubation_mobile_hackathon_2025/blocs/blocs/meeting/meetings_event.dart';
import 'package:cubeincubation_mobile_hackathon_2025/blocs/blocs/meeting/meetings_state.dart';
import 'package:cubeincubation_mobile_hackathon_2025/views/meeting_create_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controllers/meetings_controller.dart';
import '../../models/meeting_model.dart';

class MeetingsPage extends StatelessWidget {
  const MeetingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MeetingsController();

    return BlocProvider(
      create: (_) => MeetingsBloc()..add(LoadMeetings()),
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F0F0),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Toplantılarım',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MeetingCreatePage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<MeetingsBloc, MeetingsState>(
                builder: (context, state) {
                  if (state is MeetingsLoaded) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: state.meetings.length,
                      itemBuilder: (context, index) {
                        final meeting = state.meetings[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Firma: ${meeting.company}'),
                                Text('Tarih: ${meeting.date}'),
                                Text('Yer: ${meeting.table}'),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      meeting.status,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => controller.toggleFavorite(
                                        index,
                                        BlocProvider.of<MeetingsBloc>(context),
                                      ),
                                      child: Icon(
                                        meeting.isFavorite
                                            ? Icons.star
                                            : Icons.star_border,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
