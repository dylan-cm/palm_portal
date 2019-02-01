import 'package:flutter/material.dart';

class StretchyBox extends StatefulWidget {
  final double width;
  final bool stretchyWidth;
  final double height;
  final bool stretchyHeight;
  final Size envelopeSize;
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
  State<StatefulWidget> createState() => _StretchyBoxState();
}

class _StretchyBoxState extends State<StretchyBox> {
  double radius = 0.0;

  @override
  Widget build(BuildContext context) {
    var size = widget.envelopeSize == null ? MediaQuery.of(context).size : widget.envelopeSize;

    return GestureDetector(
      onTap: _onTap,
      child: Material(
        elevation: widget.elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius))
          
        ),
        color: widget.color,
        child: Container(
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.all(Radius.circular(100)),
          //   color: widget.color,
          // ),
          width: widget.width * (widget.stretchyWidth ? size.width : 1),
          height: widget.height * (widget.stretchyHeight ? size.height : 1),
        ),
      ),
    );
  }

  void _onTap(){
    radius==0 ? setState(()=> radius += 100.0) : setState(()=> radius = 0);
  }
}