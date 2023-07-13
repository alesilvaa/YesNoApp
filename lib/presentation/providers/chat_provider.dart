import 'package:flutter/widgets.dart';
import 'package:yes_no_app/domain/message.dart';

class ChatProvider extends ChangeNotifier{

  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: "Holaa", fromWho: FromWho.mine),
    Message(text: "Como te fue?", fromWho: FromWho.mine),
    Message(text: "Holaa", fromWho: FromWho.mine),
    Message(text: "Como te fue?", fromWho: FromWho.mine)
  ];

  Future<void> sendMessage( String text ) async {
    
    if(text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.mine);
    messageList.add(newMessage);

    notifyListeners();
    moveScrollToBottom();
  }


  Future moveScrollToBottom() async{
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut);
  }
}