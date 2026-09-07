import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:lab/service/api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ChatUser user1 = ChatUser(
    id: '1',
    firstName: 'me',
  );
    ChatUser user2 = ChatUser(
    id: '2',
    firstName: 'bot',
  );
  List<ChatMessage> messages = [] ; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashChat(

        currentUser: user1,
        onSend: (message) async {
           setState(() {
          messages.add(message) ; 

        });
        String botmessagw = await Api().sendRequest(message.text) ; 
        ChatMessage reply = ChatMessage(user: user2, createdAt: DateTime.now()  , text: botmessagw);
        messages.add(reply) ;  
        setState(() {
          
        });
        } , 
      messages: messages.reversed.toList(),
      ),
    );
  }
}