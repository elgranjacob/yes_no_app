import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
 
  List<Message> messageList = [
    Message(text: "Hola Salazar", fromWho: FromWho.me),
    Message(text: "Por haberte ido te vas a especial directo", fromWho: FromWho.me)];

  Future<void> sendMessage(String text) async{
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //agregar mensaje nuevo a la lista
    messageList.add(newMessage);

    //notifica a provider que algo cambio
    notifyListeners();
  }
}