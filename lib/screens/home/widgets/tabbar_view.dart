import 'package:flutter/material.dart';

class ChatTabBarView extends StatefulWidget {
  const ChatTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatTabBarView> createState() => _ChatTabBarViewState();
}

class _ChatTabBarViewState extends State<ChatTabBarView> {
  int selectedIndex = 0;
  final List<String> categories = ['Messages', 'Online', 'Groups', 'Requests'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
              child: Text(
                categories[index],
                style: TextStyle(
                    color:
                        selectedIndex == index ? Colors.white : Colors.white60,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    fontSize: selectedIndex == index ? 22 : 20),
              ),
            ),
          );
        },
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
