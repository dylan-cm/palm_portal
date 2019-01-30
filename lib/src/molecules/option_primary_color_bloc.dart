import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import '../atoms/square_button.dart';
import '../atoms/bloc_provider.dart';

class PrimaryColorOptionBloc implements BlocBase{
  final List<Color> buttonList;
  final _colors = BehaviorSubject<List<SquareButton>>();

  PrimaryColorOptionBloc(this.buttonList){
    _colors.sink.add([
      SquareButton(color: buttonList[0], select: true,),
      SquareButton(color: buttonList[1]),
      SquareButton(color: buttonList[2])
    ]);
  }
  
  final _selectedColor = BehaviorSubject<int>(seedValue: 0);

  ValueObservable<List<SquareButton>> get colorList => _colors.stream;

  Color get selectedColor => _colors.stream.value[_selectedColor.stream.value].color;

  Function(Color) get setColor => (newColor) {
    if(newColor==selectedColor) return;
    else{
      var newList = colorList.value;
      newList[colorList.value.indexWhere((i)=>i.color==newColor)] 
        = SquareButton(color: newColor, select: true,);
      newList[colorList.value.indexWhere((i)=>i.color==selectedColor)] 
        = SquareButton(color: selectedColor, select: false,);
      _colors.sink.add(newList);
      _selectedColor.sink.add(newList.indexWhere((i)=>i.select==true));
    }
  };

  void dispose(){
    _selectedColor.close();
    _colors.close();
  }
}