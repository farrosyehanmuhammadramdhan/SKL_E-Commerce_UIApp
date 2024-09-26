import 'package:e_commerce_ui/pages/ChatPage.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => MessageListPage(),
        'chatPage': (context) => ChatPage(),
      },
    );
  }
}

class MessageListPage extends StatelessWidget {
  final List<Map<String, dynamic>> _conversations = [
    {
      "name": "Customer Support",
      "lastMessage": "Sure, feel free to ask.",
      "time": "10:02 AM",
      "unreadCount": 2,
    },
    {
      "name": "Seller ABC",
      "lastMessage": "Your order has been shipped.",
      "time": "Yesterday",
      "unreadCount": 0,
    },
    {
      "name": "Seller XYZ",
      "lastMessage": "Thank you for your purchase!",
      "time": "2 days ago",
      "unreadCount": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Messages",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: const Color(0xFF4C53A5),
      ),
      body: ListView.builder(
        itemCount: _conversations.length,
        itemBuilder: (context, index) {
          return _buildConversationItem(_conversations[index], context);
        },
      ),
    );
  }

  Widget _buildConversationItem(
      Map<String, dynamic> conversation, BuildContext parentContext) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0xFF4C53A5),
        child: Text(
          conversation["name"][0],
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Text(
        conversation["name"],
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        conversation["lastMessage"],
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(conversation["time"]),
          if (conversation["unreadCount"] > 0)
            Container(
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "${conversation['unreadCount']}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),

      onTap: () {
        Navigator.pushNamed(parentContext, "chatPage");
      },
      
    );
  }
}