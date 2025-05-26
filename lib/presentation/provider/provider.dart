import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answere.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:intl/intl.dart';


class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswere = GetYesNoAnswere();
  List<Message> messageList = [

  ];

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    final newMessage = Message(
       // el estado inicial del mensaje
      text: text.trim(),
      fromWho: FromWho.me,
      time: DateFormat('hh:mm a').format(DateTime.now()).trim(),
    );
    //agregar mensaje nuevo a la lista
    messageList.add(newMessage);
    print('fluter: Cantidad de mensajes: ${messageList.length}');
    // Detectar si el usuario hizo una pregunta
    if (text.endsWith('?')) {
      herReply();
    }

    //notifica a provider que algo cambio
    notifyListeners();
    moveScrollToBottom();
  }

  //Mover el scroll hasta abajo
  Future<void> moveScrollToBottom() async {
    //animacion
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceInOut);
  }

  // Respuesta de ella
  herReply() async {
    // Obtener el mensaje de la petición  HTTP
    final herMessage = await getYesNoAnswere.getAnswere();

    // Añadimos el mensaje  de ella a la lista de mensajes
    messageList.add(herMessage);

    // Notificar a provider los cambios
    notifyListeners();

    // Mover el scroll hasta el ultimo mensaje
    moveScrollToBottom();
  }
}
