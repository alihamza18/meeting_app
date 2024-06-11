import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final int unreadCount;

  ChatTile({required this.title, required this.subtitle, this.unreadCount = 0});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(title[0]),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: unreadCount > 0
          ? CircleAvatar(
        backgroundColor: Colors.red,
        radius: 10,
        child: Text(
          '$unreadCount',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      )
          : null,
    );
  }
}