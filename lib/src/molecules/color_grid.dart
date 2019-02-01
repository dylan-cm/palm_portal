import 'package:flutter/material.dart';
import '../atoms/stretchy_box.dart';

class ColorGrid extends StatelessWidget {
  final double height;

  ColorGrid({this.height : 600});

  @override
  Widget build(BuildContext context) {
    final double buttonSize = MediaQuery.of(context).size.width / 10;

    return Container(
      width: buttonSize*10,
      height: height,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: _rowListBuilder(Colors.primaries, buttonSize)
      )
    );
  }

  List<Row> _rowListBuilder(List<MaterialColor> materialColors, double buttonSize){
    List<Row> rowList = [];
    materialColors.forEach((i){ 
      rowList.add( _rowBuilder(i, buttonSize) );
    });
    
    return rowList;
  }

  Row _rowBuilder(MaterialColor swatch, double buttonSize){
    List<StretchyBox> buttonList = [StretchyBox(
      color: swatch[50],
      width: buttonSize,
      height: buttonSize,
      stretchyWidth: false,
      elevation: 2.0,
      )];

    for(var i = 100; i < 1000; i += 100 ){
      buttonList.add( StretchyBox(
      color: swatch[i],
      width: buttonSize,
      height: buttonSize,
      stretchyWidth: false,
      elevation: 2.0,
      ) );
    }

    return Row(children: buttonList);
  }
}