// ChatBotScreen.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AIHelperr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with Bot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.all(16.0),
              children: [
                // Chat messages go here
                ChatMessage(
                  text: 'Hello! How can I help you?',
                  isBot: true,
                ),
                // Add more messages as needed
              ],
            ),
          ),
          // Input area for user to type a message
          InputArea(),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isBot;

  const ChatMessage({Key? key, required this.text, required this.isBot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isBot ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: isBot ? Colors.grey[300] : Colors.blue,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            isBot
                ? FaIcon(
                    FontAwesomeIcons.robot,
                    color: Colors.black, // Adjust color as needed
                    size: 24.0,
                  )
                : Container(), // If it's not a bot message, you can show an empty container
            SizedBox(width: 8.0),
            Text(
              text,
              style: TextStyle(color: isBot ? Colors.black : Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class InputArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type your message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Handle sending the message
            },
          ),
        ],
      ),
    );
  }
}
