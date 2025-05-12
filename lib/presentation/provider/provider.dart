import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  
  final ScrollController chatScrollController = ScrollController();
  List<Message> messageList = [
    Message(text: "HOLA, ¿Estás listo para reprobar?", fromWho: FromWho.hers),
    Message(text: "Hola Salazar", fromWho: FromWho.me),
    Message(text: "Por haberte ido te vas a especial directo", fromWho: FromWho.me)];

  Future<void> sendMessage(String text) async{
    if (text.trim().isEmpty) return;
    final newMessage = Message(text: text.trim(), fromWho: FromWho.me);
    //agregar mensaje nuevo a la lista
    messageList.add(newMessage);
    print('fluter: Cantidad de mensajes: ${messageList.length}');
    

    //notifica a provider que algo cambio
    notifyListeners();
    moveScrollToBottom();
  }
  //Mover el scroll hasta abajo
  Future<void> moveScrollToBottom() async{
    //animacion

    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(chatScrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.bounceInOut);
  }
}