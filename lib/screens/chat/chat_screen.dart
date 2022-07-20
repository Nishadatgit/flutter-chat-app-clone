import 'package:chat_app_clone/models/message_model.dart';
import 'package:chat_app_clone/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {
    final msg = Container(
      width: MediaQuery.of(context).size.width * 0.75,
      margin: isMe
          ? const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
          : const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: BoxDecoration(
          color: isMe ? const Color(0xFFFEF9EB) : const Color(0xFFFFEFEE),
          borderRadius: isMe
              ? const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )
              : const BorderRadius.only(
                  topRight: Radius.circular(
                    20,
                  ),
                  bottomRight: Radius.circular(20),
                )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.time,
            style: const TextStyle(
                color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            message.text,
          ),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: [
        msg,
        IconButton(
          onPressed: () {},
          color: message.isLiked
              ? Theme.of(context).primaryColor
              : Colors.blueGrey,
          icon: message.isLiked
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_outline),
        )
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      color: Colors.white,
      height: 70,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.emoji_emotions),
            color: Colors.blueGrey,
          ),
          Expanded(
              child: TextField(
            textCapitalization: TextCapitalization.sentences,
            decoration:
                const InputDecoration.collapsed(hintText: 'Type something ...'),
            onChanged: ((value) {}),
          )),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send),
            color: Colors.blueGrey,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
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
                      reverse: true,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(top: 15),
                      itemCount: messages.length,
                      itemBuilder: (ctx, index) {
                        final message = messages[index];
                        final bool isMe = message.sender.id == currentUser.id;
                        return _buildMessage(message, isMe);
                      }),
                ),
              ),
            ),
            _buildMessageComposer()
          ],
        ),
      ),
    );
  }
}
