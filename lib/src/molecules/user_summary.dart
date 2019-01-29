import 'package:flutter/material.dart';

class UserSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text('First Last'),
      accountEmail: Text('email@notsureifthisstays.com'),
      currentAccountPicture: CircleAvatar(), //TODO: make atom Avatar
    );
  }
}