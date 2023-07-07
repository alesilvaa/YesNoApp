import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index){
              return ( index % 2 ==0) 
              ? const MyMessageBubble()
              : const HerMessageBubble();
              
            })),
            
            MessageFieldBox(),
          
          ],
        ),
      ),
    );
  }
}