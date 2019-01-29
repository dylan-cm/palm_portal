import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String buttonTitle;

  DrawerItem(this.title, {this.icon, this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          onTap: ()=>{},
        ),
        Divider(),
      ]
    );
  }
}