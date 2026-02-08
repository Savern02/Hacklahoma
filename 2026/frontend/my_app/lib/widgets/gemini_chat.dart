import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

// Stateful widget for the chat screen
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

// State class for ChatScreen
class _ChatScreenState extends State<ChatScreen> {
  // Controller for the input field
  final TextEditingController _controller = TextEditingController();

  // List to store chat messages
  final List<Map<String, String>> _messages = [];

  // Send message function
  void sendMessageToAI() async {
    final inputText = _controller.text.trim();
    if (inputText.isEmpty) return;

    // Add user message
    setState(() {
      _messages.add({'sender': 'user', 'text': inputText});
    });

    _controller.clear();

    // Get response from Gemini
    final parts = [Part.text(inputText)];
    final response = await Gemini.instance.prompt(parts: parts);

    setState(() {
      _messages.add({
        'sender': 'bot',
        'text': response?.output ?? 'No response generated',
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('AI Coach'),
        backgroundColor: colorScheme.primary,       // correct usage
        foregroundColor: colorScheme.onPrimary,     // correct usage
      ),
      body: Column(
        children: [
          // Chat messages list
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUser = message['sender'] == 'user';
                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 4, horizontal: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blue[100] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(message['text'] ?? ''),
                  ),
                );
              },
            ),
          ),
          // Input field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: sendMessageToAI,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
