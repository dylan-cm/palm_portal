import 'package:flutter/material.dart';
import '../molecules/widget_appender.dart';

Widget editorBar () {
  return AppBar(
    actions: <Widget>[
      AddWidget(),
      IconButton(
        icon: Icon(Icons.color_lens),
        onPressed: ()=>{}, //TODO: Navigators
      ),
      IconButton(
        icon: Icon(Icons.remove_red_eye),
        onPressed: ()=>{},
      )
    ],
  );
}
