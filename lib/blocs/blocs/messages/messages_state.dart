import 'package:cubeincubation_mobile_hackathon_2025/models/message_model.dart';

abstract class MessagesState {}

class MessagesInitial extends MessagesState {}

class MessagesLoaded extends MessagesState {
  final List<MessageModel> messages;

  MessagesLoaded(this.messages);
}
