import 'package:flutter/material.dart';

class FontPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 116,
      child: Container(
        alignment: Alignment(-1, 0),
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Text(
          Theme.of(context).textTheme.headline.fontFamily,
          style: TextStyle(fontSize: 44),
        ),
      ),
    );
  }
}