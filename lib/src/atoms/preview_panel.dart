import 'package:flutter/material.dart';

class PreviewPanel extends StatelessWidget {
  final double scalor;
  final MaterialColor color;

  PreviewPanel({
    this.color, this.scalor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(
          maxHeight: 180*scalor,
          // minHeight: 60.0,
          maxWidth: 106.0*scalor,
          // minWidth: 36.0
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 2,
              color: Color(0xFFDDDDDD),
            )
          ],
          color: Color(
            color.withAlpha( ( 255*(scalor+0.1) ).round() ).hashCode
          )
        ),
      );
  }
}