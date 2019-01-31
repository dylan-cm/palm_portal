import 'package:flutter/material.dart';

class StretchyBox extends StatelessWidget {
  final double width;
  final bool stretchyWidth;
  final double height;
  final bool stretchyHeight;
  Size envelopeSize;
  final Color color;
  final double elevation;

  StretchyBox({
    this.width : 1.0, 
    this.stretchyWidth : true,
    this.height : 100.0, 
    this.stretchyHeight : false,
    this.envelopeSize,
    this.color : Colors.grey,
    this.elevation : 0,
  });

  @override
  Widget build(BuildContext context) {
    envelopeSize ??= MediaQuery.of(context).size;

    return Material(
      elevation: elevation,
      color: color,
      child: SizedBox(
        width: width * (stretchyWidth ? envelopeSize.width : 1),
        height: height * (stretchyHeight ? envelopeSize.height : 1),
      ),
    );
  }
}