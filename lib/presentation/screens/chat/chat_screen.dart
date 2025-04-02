import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://th.bing.com/th/id/R.fddb1c63639dd8da75b8d181f0b44590?rik=ODZqhUCXRygUMg&pid=ImgRaw&r=0'),
          ),
        ),
        title: Text('Mi amor'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 10),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child:  ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                return const MyMessageBubble();
              })
            ),
          ],
        ),
      ),
    );
  }
}