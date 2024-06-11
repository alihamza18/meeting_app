import 'package:alpha_ui/pages/calendar_page.dart';
import 'package:alpha_ui/pages/chats_page.dart';
import 'package:alpha_ui/pages/overview_page.dart';

import 'package:flutter/material.dart';
import 'package:alpha_ui/pages/convo_page.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Color(0xffF1F3F7),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'lib/icons/alpha.png', // Replace with your logo asset
                height: 50,
              ),
              SizedBox(height: 10),
              Text(
                'alpha',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        _createDrawerItem(
          icon: Icons.dashboard,
          text:
          'Overview',
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>OverviewPage()));
          },


        ),
        ExpansionTile(
          backgroundColor: Color(0xffF1F3F7),
          leading: Icon(Icons.shopping_cart),
          title: Text('E-Commerce'),
          children: <Widget>[
            _createDrawerItem(
              text: 'Sub-item 1',
              onTap: () {},
            ),
            _createDrawerItem(
              text: 'Sub-item 2',
              onTap: () {},
            ),
          ],
        ),
        _createDrawerItem(

          icon: Icons.calendar_today,
          text: 'Calendar',
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CalendarPage()));
          },
          selected: true, // Set this true for the selected item
        ),
        _createDrawerItem(
          icon: Icons.mail,
          text: 'Mail',
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatsPage()));
          },
          trailing: _notificationBadge(8),
        ),
        _createDrawerItem(
          icon: Icons.chat,
          text: 'Chat',
          onTap: () {
            Navigator.push(context,MaterialPageRoute(builder:(context)=>ConvoPage()));
          },
        ),
        _createDrawerItem(
          icon: Icons.check_box,
          text: 'Tasks',
          onTap: () {
            Navigator.pop(context);
          },
        ),
        _createDrawerItem(
          icon: Icons.folder,
          text: 'Projects',
          onTap: () {
            Navigator.pop(context);
          },
        ),
        _createDrawerItem(
          icon: Icons.file_copy,
          text: 'File Manager',
          onTap: () {
            Navigator.pop(context);
          },
        ),
        _createDrawerItem(
          icon: Icons.notes,
          text: 'Notes',
          onTap: () {
            Navigator.pop(context);
          },
        ),
        _createDrawerItem(
          icon: Icons.contacts,
          text: 'Contacts',
          onTap: () {
            Navigator.pop(context);
          },
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'CALENDARS',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        _createDrawerItem(
          icon: Icons.circle,
          iconColor: Colors.red,
          text: 'Important',
          onTap: () {
            Navigator.pop(context);
          },
        ),
        _createDrawerItem(
          icon: Icons.circle,
          iconColor: Colors.orange,
          text: 'Meeting',
          onTap: () {
            Navigator.pop(context);
          },
        ),
        _createDrawerItem(
          icon: Icons.circle,
          iconColor: Colors.green,
          text: 'Event',
          onTap: () {
            Navigator.pop(context);
          },
        ),
        _createDrawerItem(
          icon: Icons.circle,
          iconColor: Colors.purple,
          text: 'Work',
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.add, color: Colors.grey),
          title: Text('Add Calendar'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget _createDrawerItem(
      {IconData? icon,
        Color? iconColor,
        required String text,
        GestureTapCallback? onTap,
        Widget? trailing,
        bool selected = false}) {
    return ListTile(
      leading: icon != null
          ? Icon(
        icon,
        color: iconColor ?? Colors.black,
      )
          : null,
      title: Text(
        text,
        style: TextStyle(
          color: selected ? Colors.blue : Colors.black,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }

  Widget _notificationBadge(int count) {
    return Container(
      padding: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Text(
        '$count',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }
}
