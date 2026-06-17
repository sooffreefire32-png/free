import 'package:flutter/material.dart';
import '../widgets/message_bubble.dart';
import '../widgets/chat_input_field.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = '/chat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: 20, // Example; replace with real count.
              itemBuilder: (ctx, i) => const MessageBubble(
                message: 'Sample Message',
                isMe: i % 2 == 0,
              ),
            ),
          ),
          const ChatInputField(),
        ],
      ),
    );
  }
}