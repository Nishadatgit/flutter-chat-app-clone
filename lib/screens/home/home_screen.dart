import 'package:chat_app_clone/models/message_model.dart';
import 'package:chat_app_clone/screens/home/widgets/favourite_contacts.dart';
import 'package:chat_app_clone/screens/home/widgets/recent_chats.dart';
import 'package:chat_app_clone/screens/home/widgets/tabbar_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Chats',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const ChatTabBarView(),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xfffef9eb),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children:const [
                     FavoriteContacts(),
                    RecentChats()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


