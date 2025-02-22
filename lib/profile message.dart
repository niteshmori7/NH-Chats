import 'package:flutter/material.dart';

import 'home.dart';

class chmessage extends StatefulWidget {
  const chmessage({super.key});

  @override
  State<chmessage> createState() => _chmessageState();
}

class _chmessageState extends State<chmessage> {
  List<String> messages = []; // List to store messages
  TextEditingController _messageController = TextEditingController(); // Controller for text input

  void _sendMessage() {
    String message = _messageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        messages.add(message);
      });
      _messageController.clear(); // Clear input field after sending
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Chat Header
          Stack(
            children: [
              Container(
                height: 110,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 58, left: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => HomeScreen(),
                      ),
                    );
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white, size: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 58),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/aiimage.jpeg",
                        height: 50,
                        width: 50,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 88, left: 103),
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.green,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 53, left: 135),
                child: Column(
                  children: [
                    Text(
                      "Alex Carry",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 45),
                      child: Text(
                        "Online",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Chat Messages Section
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: messages.isEmpty
                  ? Center(child: Text("No messages yet..."))
                  : ListView.builder(
                reverse: false,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        messages[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Fixed Bottom Chat Input
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Send a message...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blueAccent),
                  onPressed: _sendMessage, // Call function on press
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
