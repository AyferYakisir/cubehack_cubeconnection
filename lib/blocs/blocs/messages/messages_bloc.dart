import 'package:cubeincubation_mobile_hackathon_2025/models/message_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'messages_event.dart';
import 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  MessagesBloc()
    : super(
        MessagesLoaded([
          MessageModel(
            text:
                'Merhaba, ben cubeconnect yatırımcısıyım. Girişiminiz hakkında daha detaylı bilgi alabilir miyim?',
            isMe: true,
            timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
          ),
          MessageModel(
            text: 'Tabii ki,saat 14:00\'te toplantı yapalım?',
            isMe: false,
            timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
          ),
        ]),
      ) {
    on<SendMessage>(_onSendMessage);
  }

  void _onSendMessage(SendMessage event, Emitter<MessagesState> emit) {
    if (state is MessagesLoaded) {
      final currentMessages = (state as MessagesLoaded).messages;
      final newMessage = MessageModel(
        text: event.text,
        isMe: true,
        timestamp: DateTime.now(),
      );
      final updatedMessages = List<MessageModel>.from(currentMessages)
        ..add(newMessage);

      emit(MessagesLoaded(updatedMessages));
    }
  }
}
