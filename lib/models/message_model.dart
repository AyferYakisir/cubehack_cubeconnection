class MessageModel {
  final String text;
  final bool isMe;
  final DateTime timestamp;

  MessageModel({
    required this.text,
    required this.isMe,
    required this.timestamp,
  });
}
