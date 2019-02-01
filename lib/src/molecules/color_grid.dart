import 'package:flutter/material.dart';
import '../atoms/stretchy_box.dart';
import '../atoms/bloc_provider.dart';
import '../theme.dart';

class ColorGrid extends StatelessWidget {
  final double height;
  final double padding;

  ColorGrid({this.height : 600, this.padding : 0});

  @override
  Widget build(BuildContext context) {
    final double buttonSize = MediaQuery.of(context).size.width / 10;
    final bloc = BlocProvider.of<ThemeBloc>(context);

    return Container(
      width: buttonSize*10,
      height: height,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: _rowListBuilder(Colors.primaries, buttonSize, bloc)
      )
    );
  }

  List<Row> _rowListBuilder(List<MaterialColor> materialColors, double buttonSize, ThemeBloc bloc){
    List<Row> rowList = [];
    materialColors.forEach((color){ 
      rowList.add( _rowBuilder(color, buttonSize, bloc) );
    });
    
    return rowList;
  }

  Row _rowBuilder(MaterialColor swatch, double buttonSize, ThemeBloc bloc){
    List<Widget> buttonList = [_boxBuilder(bloc, swatch[50], buttonSize)];
    for(var i = 100; i < 1000; i += 100 ){
      buttonList.add(Opacity(
        opacity: 0,
        child: StretchyBox(
          height: buttonSize,
          width: padding,
        )
      ));
      buttonList.add(_boxBuilder(bloc, swatch[i], buttonSize));
    }
    return Row(children: buttonList);
  }

  Widget _boxBuilder(ThemeBloc bloc, Color color, double buttonSize){
    return GestureDetector(
      onTap: () => _onTap(bloc, color),
      child: StretchyBox(
        color: color,
        width: buttonSize,
        height: buttonSize,
        stretchyWidth: false,
        elevation: 2.0,
        radius: bloc.theme != null && color == Color(bloc.theme.primaryColor) ? 100 : 0 ,
      )
    );
  }

  void _onTap(ThemeBloc bloc, Color color){
    bloc.setTheme(
      ThemeModel(
        primaryColor: int.parse(color.toString().substring(6,16))
      )
    );
  }
}