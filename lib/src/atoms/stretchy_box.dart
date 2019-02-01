import 'package:flutter/material.dart';

class StretchyBox extends StatelessWidget {
  final double width;
  final bool stretchyWidth;
  final double height;
  final bool stretchyHeight;
  final Size envelopeSize;
  final Color color;
  final double elevation;
  final double radius;

  StretchyBox({
    this.width : 1.0, 
    this.stretchyWidth : true,
    this.height : 100.0, 
    this.stretchyHeight : false,
    this.envelopeSize,
    this.color : Colors.grey,
    this.elevation : 0.0,
    this.radius : 0.0,
  });

  @override
  Widget build(BuildContext context) {
    var size = envelopeSize == null ? MediaQuery.of(context).size : envelopeSize;

    return  Material(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius))
      ),
      color: color,
      child: Container(
        width: width * (stretchyWidth ? size.width : 1),
        height: height * (stretchyHeight ? size.height : 1),
      ),
    );
  }
}