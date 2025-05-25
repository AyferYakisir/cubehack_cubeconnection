abstract class MessagesEvent {}

class SendMessage extends MessagesEvent {
  final String text;

  SendMessage(this.text);
}
