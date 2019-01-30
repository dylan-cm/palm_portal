import 'package:flutter/material.dart';
import 'bloc_provider.dart';
import '../molecules/option_primary_color_bloc.dart';

class SquareButton extends StatelessWidget {
  final Color color;
  final bool select;
  static const double _selected = 8.0;
  static const double _deselected = 1.0;

  SquareButton({this.color, this.select: false});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PrimaryColorOptionBloc>(context);

    return ButtonTheme(
      minWidth: 44.0,
      height: 44.0,
      child: RaisedButton(
        onPressed: ()=>bloc.setColor(color),
        color: color,
        elevation: select?_selected:_deselected,
      )
    );
  }
  
}