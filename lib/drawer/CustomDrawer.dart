import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Handle item 1 tap
              Navigator.pop(context); // Close drawer
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Handle item 2 tap
              Navigator.pop(context); // Close drawer
            },
          ),
          ListTile(
            title: const Text('Item 3'),
            onTap: () {
              // Handle item 3 tap
              Navigator.pop(context); // Close drawer
            },
          ),
        ],
      ),
    );
  }
}
