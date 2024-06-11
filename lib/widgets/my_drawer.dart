// lib/widgets/my_drawer.dart

import 'package:alpha_ui/widgets/drawer_list.dart';
import 'package:flutter/material.dart';
 // Import the new drawer list file

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: DrawerList(), // Use the DrawerList widget here
    );
  }
}
