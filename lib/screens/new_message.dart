import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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

  void submitMessage() async {
    final enteredMessage = messageController.text;
    if (enteredMessage.trim().isEmpty) {
      return;
    }

    FocusScope.of(context).unfocus();
    messageController.clear();

    final user = FirebaseAuth.instance.currentUser!;
    final userData =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

    FirebaseFirestore.instance.collection('chat').add({
      'text': enteredMessage,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'username': userData.data()!['username'],
    });
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
