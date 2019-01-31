import 'package:flutter/material.dart';
import '../molecules/brand_color_display.dart';

class ColorPicker extends StatefulWidget {
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  double alignY = 0.0;
  double opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(200, 200, 200, opacity),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height-80,
      alignment: Alignment(0, alignY),
      child: BrandColorDisplay(
      onPressed: showDetail,
      ),
    );
  }

  void showDetail(){
    setState(() {
      alignY = -1.0;
      opacity = 1.0;
    });
  }
}