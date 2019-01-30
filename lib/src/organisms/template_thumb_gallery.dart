import 'package:flutter/material.dart';
import '../atoms/preview_panel.dart';
import '../atoms/bloc_provider.dart';
import '../molecules/option_primary_color_bloc.dart';

class TemplateThumbGallery extends StatefulWidget{
  @override
  State<TemplateThumbGallery> createState() => _TemplateThumbGalleryState();
}

class _TemplateThumbGalleryState extends State<TemplateThumbGallery> {
  double scale = 0.9;
  double position = 0.0;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PrimaryColorOptionBloc>(context);
    return Container(
      alignment: Alignment(position, 0),
      height: 200.0,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16.0),
      child: gallery(bloc),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 10,
            color: Color(0xFFDDDDDD),
          )
        ]
      )
    );
  }

  Widget gallery(PrimaryColorOptionBloc bloc){
    return StreamBuilder(
      stream: bloc.colorList,
      builder: (context, snapshot)=>GestureDetector(
        onHorizontalDragUpdate: scaleAndSlide,
        onHorizontalDragEnd: snap,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            PreviewPanel(color: bloc.selectedColor, scalor: scale,),
          ],
        ),
      ),
    );
  }

  void scaleAndSlide(DragUpdateDetails drag){
    setState(() {
      scale=0.9-(0.588-(drag.globalPosition.dx)/350).abs();
      position=(drag.globalPosition.dx/412*2)-1;
    });
  }

  void snap(DragEndDetails drag){
    setState(() {
      if(scale < 0.45) {scale = 0.3; position = position.sign*1.0;}
      else if(scale < 0.75) {scale = 0.6; position = position.sign*0.5;}
      else {scale = 0.9; position = 0;}
    });
  }

}