import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Map<String, dynamic>> _messages = [
    {
      "message": "Hi! How can I help you?", 
      "isMe": false, 
      "time": "10:00 AM"
    },

    {
      "message": "I have a question about a product",
      "isMe": true,
      "time": "10:01 AM"
    },

    {
      "message": "Sure, feel free to ask", 
      "isMe": false, 
      "time": "10:02 AM"
    },
  ];

  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    String text = _messageController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add({"message": text, "isMe": true, "time": "Now"});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Customer Support",
          style: TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: const Color(0xFF4C53A5),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              return _buildMessageItem(_messages[index]);
            },
          )),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageItem(Map<String, dynamic> message) {
    bool isMe = message['isMe'];
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
            color: isMe ? const Color(0xFF4C53A5) : Colors.grey[300],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message['message'],
              style: TextStyle(
                  color: isMe ? Colors.white : Colors.black, 
                  fontSize: 16
                ),
            ),
            Text(
              message['time'],
              style: TextStyle(
                  color: isMe ? Colors.white70 : Colors.black54, 
                  fontSize: 12
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: "Type your message...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none
                ),
                filled: true,
                fillColor: Colors.grey[200]
              ),
            ),
          ),
          IconButton(
            onPressed: _sendMessage, 
            icon: const Icon(
              Icons.send,
              color:  Color(0xFF4C53A5),
            ))
        ],
      ),
    );
  }
}
