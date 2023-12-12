import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Chat'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(8.0),
              children: [
                ChatMessage(isSentByMe: true, message: 'Hello!'),
                ChatMessage(isSentByMe: false, message: 'Hi there!'),
                // Add more messages as needed
              ],
            ),
          ),
          _buildInputField(context),
        ],
      ),
    );
  }

  Widget _buildInputField(BuildContext context) {
    TextEditingController _messageController = TextEditingController();

    return Container(
      padding: EdgeInsets.all(8.0),
      color: Colors.black,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Type your message...',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 8.0),
          IconButton(
            icon: Icon(Icons.send, color: Colors.white),
            onPressed: () {
              String messageText = _messageController.text.trim();
              if (messageText.isNotEmpty) {
                // Add your logic to send the message
                // For now, let's just print the message to the console
                print('Sending message: $messageText');
              }
              _messageController.clear();
            },
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final bool isSentByMe;
  final String message;

  const ChatMessage({
    required this.isSentByMe,
    required this.message,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isSentByMe ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.black),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isSentByMe ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MessageScreen(),
  ));
}
