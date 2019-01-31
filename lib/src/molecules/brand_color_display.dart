import 'package:flutter/material.dart';
import '../atoms/stretchy_box.dart';

class BrandColorDisplay extends StatelessWidget {
  //Displays Brand's Color ID, tap to open color picker
  final VoidCallback onPressed;

  BrandColorDisplay({ @required this.onPressed });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      padding: EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StretchyBox(
            color: Theme.of(context).primaryColor,
            width: 0.5,
          ),
          StretchyBox(
            color: Theme.of(context).accentColor,
            width: 0.25,
          ),
          StretchyBox(
            color: Theme.of(context).primaryColorLight,
            width: 0.125,
          ),
          StretchyBox(
            color: Theme.of(context).primaryColorDark,
            width: 0.125,
          ),
        ],
      ),
    );
  }
}