import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance
              .collection('chat')
              .orderBy('createdAt', descending: true)
              .snapshots(),
      builder: (ctx, chatSnapshots) {
        if (!chatSnapshots.hasData || chatSnapshots.data!.docs.isEmpty) {
          return Center(child: Text('No messages found;'));
        }
        if (chatSnapshots.hasError) {
          return Center(child: Text('Something went wrong;'));
        }
        final loadedMessages = chatSnapshots.data!.docs;

        return ListView.builder(
          padding: EdgeInsets.only(bottom: 40, left: 16, right: 16),
          reverse: true,
          itemCount: loadedMessages.length,
          itemBuilder: (ctx, index) {
            final currentMessage = loadedMessages[index];
            final currentUserId = currentMessage['userId'];
            final isMe =
                FirebaseAuth.instance.currentUser!.uid == currentUserId;

            // Provjera da li je user promijenjen u odnosu na prethodni
            final showUsername =
                index == loadedMessages.length - 1 ||
                loadedMessages[index + 1]['userId'] != currentUserId;

            return Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                if (showUsername)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 2),
                    child: Text(
                      currentMessage['username'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isMe ? Colors.deepPurple[100] : Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(currentMessage['text']),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
