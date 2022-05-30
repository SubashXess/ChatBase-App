import 'package:chatbase_app/Screens/Chat_Details_Screen/chat_details_screen.dart';

class ChatMessages {
  String? message;
  String? dateTime;
  MessageType? type;
  ChatMessages(
      {required this.message, required this.dateTime, required this.type});
}
