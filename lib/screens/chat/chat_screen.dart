import 'package:chat_app_clone/models/message_model.dart';
import 'package:chat_app_clone/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          iconSize: 22,
          color: Colors.white,
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          widget.user.name,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
            iconSize: 30,
            color: Colors.white,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: ListView.builder(
                    padding: const EdgeInsets.only(top: 15),
                    itemCount: messages.length,
                    itemBuilder: (ctx, index) {
                      final message = messages[index];
                      return Text(message.text);
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
