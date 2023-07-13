import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/screens/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://www.stylist.co.uk/images/app/uploads/2020/02/17173956/ja-1120x1120.jpg?auto=format%2Ccompress&fit=max&fm=webp&monochrome=38000000&q=75&w=1400"),
          ),
        ),
        title: const Text("WhatsApp"),
        //centerTitle : Centrar en Ios y Android
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index){
              
              final message = chatProvider.messageList[index];

              return (message.fromWho == FromWho.hers)
                ? const HerMessageBubble()
                :  MyMessageBubble(message: message,);
              
            })),
            
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            ),
          
          ],
        ),
      ),
    );
  }
}