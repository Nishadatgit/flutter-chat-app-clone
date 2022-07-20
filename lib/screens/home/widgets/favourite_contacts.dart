import 'package:chat_app_clone/models/message_model.dart';
import 'package:chat_app_clone/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteContacts extends StatelessWidget {
  const FavoriteContacts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Favourite Contacts',
                style: TextStyle(
                    color: Colors.blueGrey, fontSize: 18, letterSpacing: 1),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz,
                ),
                color: Colors.blueGrey,
                iconSize: 30,
              )
            ],
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(ChatScreen(user: favorites[index]),transition: Transition.cupertino);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(favorites[index].imageUrl),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        favorites[index].name,
                        style: const TextStyle(
                            color: Colors.blueGrey, fontSize: 16),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: favorites.length,
          ),
        )
      ],
    );
  }
}
