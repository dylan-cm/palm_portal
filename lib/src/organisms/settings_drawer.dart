import 'package:flutter/material.dart';
import '../molecules/drawer_item.dart';
import '../molecules/user_summary.dart';

class SettingsDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[ //TODO: Refactor into 2 molecules: UserSummary, DrawerList
          UserSummary(),
          DrawerItem('Subscription',
            icon: Icons.favorite,
            buttonTitle: 'Upgrade',
            ),
          DrawerItem('Manage Password',
            icon: Icons.lock,
          ),
          DrawerItem('Log Out')
        ],
      ),
    );
  }
}