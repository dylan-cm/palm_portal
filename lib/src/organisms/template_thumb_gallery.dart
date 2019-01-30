import 'package:flutter/material.dart';

class TemplateThumbGallery extends StatefulWidget{
  @override
  State<TemplateThumbGallery> createState() => _TemplateThumbGalleryState();
}

class _TemplateThumbGalleryState extends State<TemplateThumbGallery> {
  // Animation<double> thumbnailAnimation;
  // AnimationController thumbnailController;
  double scale = 0.9;
  double position = 0.0;

  // void initState() { 
  //   super.initState();
    

    
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(position, 0),
      height: 200.0,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16.0),
      child: gallery(),
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

  Widget gallery(){
    return GestureDetector(
      onHorizontalDragUpdate: scaleAndSlide,
      onHorizontalDragEnd: snap,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          panel1(Colors.red),
          panel2(Colors.green),
          
        ],
      ),
    );
  }

  void scaleAndSlide(DragUpdateDetails drag){
    setState(() {
      scale=0.9-(0.588-(drag.globalPosition.dx)/350).abs();
      position=(drag.globalPosition.dx/412*2)-1;
      print(scale);
    });
  }

  void snap(DragEndDetails drag){
    setState(() {
      if(scale < 0.45) {scale = 0.3; position = position.sign*1.0;}
      else if(scale < 0.75) {scale = 0.6; position = position.sign*0.5;}
      else {scale = 0.9; position = 0;}
    });
  }

  Widget panel1(MaterialColor color){
    return Container(
        constraints: BoxConstraints(
          maxHeight: 180*scale,
          // minHeight: 60.0,
          maxWidth: 106.0*scale,
          // minWidth: 36.0
        ),
        decoration: BoxDecoration(
          color: color
        ),
      );
  }

  Widget panel2(MaterialColor color){
    return Container(
        constraints: BoxConstraints(
          maxHeight: 180*scale*0.5,
          // minHeight: 60.0,
          maxWidth: 30.0*scale,
          // minWidth: 36.0
        ),
        decoration: BoxDecoration(
          color: color
        ),
      );
  }
}