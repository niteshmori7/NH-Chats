import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'home.dart';

class ChMessage extends StatefulWidget {
  const ChMessage({super.key});

  @override
  State<ChMessage> createState() => _ChMessageState();
}

class _ChMessageState extends State<ChMessage> {
  List<Map<String, dynamic>> messages = [];
  TextEditingController _messageController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final ScrollController _scrollController = ScrollController(); // ScrollController added

  void _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Delete Message"),
          content: Text("Are you sure you want to delete this message?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  messages.removeAt(index);
                });
                Navigator.pop(context); // Close the dialog after deleting
              },
              child: Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }


  void _sendMessage() {
    String message = _messageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        messages.add({"type": "text", "content": message});
      });
      _messageController.clear();
      _scrollToBottom(); // Auto-scroll to last message
    }
  }

  Future<void> _sendImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        messages.add({"type": "image", "content": image.path});
      });
      _scrollToBottom(); // Auto-scroll after adding image
    }
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Chat Header
          Stack(
            children: [
              Container(
                height: 110,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.blueAccent),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 58, left: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Icon(Icons.arrow_back, color: Colors.white, size: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 58),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/aiimage.jpeg",
                    height: 50,
                    width: 50,
                    fit: BoxFit.fill,
                  ),
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
                    Text(
                      "Online",
                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.w500),
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
                controller: _scrollController, // Assign scroll controller
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index];

                  return Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onLongPress: () {
                        _showDeleteDialog(index); // Show delete dialog
                      },
                      onTap: () {
                        if (msg["type"] == "image") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullImageScreen(imagePath: msg["content"]),
                            ),
                          );
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        padding: msg["type"] == "text" ? EdgeInsets.all(12) : null,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: msg["type"] == "text"
                            ? Text(
                          msg["content"],
                          style: TextStyle(color: Colors.white),
                        )
                            : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            File(msg["content"]),
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
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
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.camera_alt, color: Colors.blueAccent),
                  onPressed: _sendImage,
                ),
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
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class FullImageScreen extends StatelessWidget {
  final String imagePath;

  const FullImageScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: InteractiveViewer(
          panEnabled: false, // Prevents unnecessary pan when zooming
          boundaryMargin: EdgeInsets.all(20),
          minScale: 0.5,
          maxScale: 2.0,
          child: Image.file(File(imagePath)),
        ),
      ),
    );
  }
}


