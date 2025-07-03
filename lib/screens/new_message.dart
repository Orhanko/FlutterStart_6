import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() {
    return NewMessageState();
  }
}

class NewMessageState extends State<NewMessage> {
  var messageController = TextEditingController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  void submitMessage() {
    final enteredMessage = messageController.text;
    if (enteredMessage.trim().isEmpty) {
      return;
    }

    //send to Firebase
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 2, bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(labelText: "Aa..."),
            ),
          ),
          IconButton(
            color: Theme.of(context).colorScheme.primary,
            onPressed: submitMessage,
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
