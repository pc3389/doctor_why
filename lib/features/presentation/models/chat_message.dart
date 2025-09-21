import 'package:dbheatlcareproject/features/presentation/models/question_data.dart';

enum MessageSender { user, ai }

class ChatMessage {
  final String id; // 메시지 고유 ID (예: UUID)
  final String? text;
  final String? hint;
  final MessageSender sender;
  final AnswerType answerType;
  final dynamic buttonPayload;

  ChatMessage({
    required this.id,
    this.text,
    this.hint,
    required this.sender,
    required this.answerType,
    this.buttonPayload,
  });
}
