import 'package:chatbase_app/Models/Users/user.dart';

class Messages {
  User? user;
  String? lastMessage;
  String? lastTime;
  bool? isContinue;
  Messages(
      {this.user, this.lastMessage, this.lastTime, this.isContinue = false});

  static List<Messages> generateHomePageMessages() {
    return [
      Messages(user: users[0], lastMessage: "Hi John", lastTime: "18:32"),
      Messages(
          user: users[1],
          lastMessage: "Hey there! What's up?",
          lastTime: "18:06"),
      Messages(
          user: users[2],
          lastMessage: "What are you doing now?",
          lastTime: "15:58"),
      Messages(
          user: users[3],
          lastMessage: "Can I call you back? I'm in the hospital now.",
          lastTime: "15:57"),
      Messages(
          user: users[4],
          lastMessage: "Yeah, Do you have any good songs to suggest?",
          lastTime: "15:32"),
      Messages(
          user: users[5],
          lastMessage: "Hi! I went shopping today and I missed your message!",
          lastTime: "15:31"),
    ];
  }

  static List<Messages> generateMessagesFromUser() {
    return [
      Messages(
          user: users[0],
          lastMessage: "Hey there! What's up? Is everything going well?",
          lastTime: "18:35"),
      Messages(
          user: me,
          lastMessage:
              "Nothing. Just chilling and watching YouTube. What about you?",
          lastTime: "18:36"),
      Messages(
          user: users[0],
          lastMessage:
              "Same here! Been watching YouTube for the past 5 hours despite of having so much to do! 😅",
          lastTime: "18:38",
          isContinue: true),
      Messages(
          user: users[0],
          lastMessage: "It's hard to be productive, man 🙄",
          lastTime: "18:39"),
      Messages(
          user: me,
          lastMessage: "Yeah I know, I'm in the same position",
          lastTime: "18:40"),
      Messages(user: users[0], lastMessage: "lol 🤣", lastTime: "18:40"),
    ];
  }
}

var users = User.generateUsers();
var me = User(
    id: 0,
    firstName: "Sylvanus",
    lastName: "Xess",
    profileImage: "assets/profilepic/userImage4.jpeg");
