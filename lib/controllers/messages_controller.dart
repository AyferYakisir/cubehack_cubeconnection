import 'package:cubeincubation_mobile_hackathon_2025/blocs/blocs/messages/messages_event.dart';

class MessagesController {
  void sendMessage(String messageText, context, bloc) {
    bloc.add(SendMessage(messageText));
  }
}
