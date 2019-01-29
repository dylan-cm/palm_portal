import 'package:flutter/material.dart';
import '../organisms/editor_bar.dart';
import '../organisms/settings_drawer.dart';

class Editor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: editorBar(),
      body: Container(),
      drawer: SettingsDrawer(),
    );
  }
}