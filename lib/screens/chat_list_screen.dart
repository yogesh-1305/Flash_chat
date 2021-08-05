import 'package:cached_network_image/cached_network_image.dart';
import 'package:flash_chat/screens/setting_screen.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatefulWidget {
  static const id = 'chatList_screen';

  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SettingScreen.id);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        'https://googleflutter.com/sample_image.jpg'),
                    fit: BoxFit.fill),
              ),
            ),
          ),
        ),
        title: Text('Chats'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: ListView(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              'https://googleflutter.com/sample_image.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Group Name 1'),
                    Row(
                      children: [
                        Icon(
                          Icons.image,
                          size: 16,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Group message 1'),
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
