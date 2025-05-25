import 'package:cubeincubation_mobile_hackathon_2025/blocs/blocs/meeting_create.dart/meeting_create_bloc.dart';
import 'package:cubeincubation_mobile_hackathon_2025/blocs/blocs/meeting_create.dart/meeting_create_event.dart';
import 'package:cubeincubation_mobile_hackathon_2025/blocs/blocs/meeting_create.dart/meeting_create_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controllers/meeting_create_controller.dart';

class MeetingCreatePage extends StatelessWidget {
  const MeetingCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MeetingCreateController();

    return BlocProvider(
      create: (_) => MeetingCreateBloc(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F0F0),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF6F0F0),
          elevation: 0,
          title: const Text(
            'Hoşgeldiniz,\nCubeconnect',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          actions: const [
            Icon(Icons.favorite_border, color: Colors.black),
            SizedBox(width: 16),
            Icon(Icons.notifications_none, color: Colors.black),
            SizedBox(width: 16),
            Icon(Icons.person_outline, color: Colors.black),
            SizedBox(width: 12),
          ],
        ),
        body: BlocBuilder<MeetingCreateBloc, MeetingCreateState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Toplantı Masası Seçiniz',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 2.5,
                        ),
                    itemCount: 25,
                    itemBuilder: (context, index) {
                      final tableNumber = index + 1;
                      final isSelected = state.selectedTable == tableNumber;
                      return GestureDetector(
                        onTap: () {
                          controller.selectTable(
                            tableNumber,
                            context.read<MeetingCreateBloc>(),
                          );
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(24),
                              ),
                            ),
                            builder: (_) => TimePickerModal(
                              bloc: context.read<MeetingCreateBloc>(),
                            ),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFFB5E2C0)
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text('$tableNumber'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class TimePickerModal extends StatefulWidget {
  final MeetingCreateBloc bloc;
  const TimePickerModal({super.key, required this.bloc});

  @override
  State<TimePickerModal> createState() => _TimePickerModalState();
}

class _TimePickerModalState extends State<TimePickerModal> {
  int selectedHour = 14;
  int selectedMinute = 0;

  FixedExtentScrollController hourController = FixedExtentScrollController(
    initialItem: 14,
  );
  FixedExtentScrollController minuteController = FixedExtentScrollController(
    initialItem: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Toplantı Saati Seçiniz',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListWheelScrollView.useDelegate(
                    controller: hourController,
                    itemExtent: 40,
                    onSelectedItemChanged: (value) =>
                        setState(() => selectedHour = value),
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) => Center(
                        child: Text(
                          index.toString().padLeft(2, '0'),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      childCount: 24,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(':', style: TextStyle(fontSize: 24)),
                ),
                Expanded(
                  child: ListWheelScrollView.useDelegate(
                    controller: minuteController,
                    itemExtent: 40,
                    onSelectedItemChanged: (value) =>
                        setState(() => selectedMinute = value),
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) => Center(
                        child: Text(
                          index.toString().padLeft(2, '0'),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      childCount: 60,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton.icon(
              onPressed: () {
                widget.bloc.add(
                  SelectTime(
                    TimeOfDay(hour: selectedHour, minute: selectedMinute),
                  ),
                );
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Toplantı Oluştur'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB5E2C0),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
