import 'package:flutter/material.dart';
import '../molecules/brand_color_display.dart';
import '../molecules/color_grid.dart';

class ColorPicker extends StatefulWidget {
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> with TickerProviderStateMixin {
  Animation<double> detailsAnimation;
  AnimationController detailsController;

  void initState() { 
    super.initState();
    
    detailsController = AnimationController(
      duration: Duration(milliseconds: 150),
      vsync: this,
    );

    detailsAnimation = Tween(begin:0.0 , end: 1.0).animate(
      CurvedAnimation(
        parent: detailsController,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ColorGrid()
    ;
  }

  void onTap(){
    if(detailsController.status == AnimationStatus.dismissed){
      this.detailsController.forward();
    }
    else if(detailsController.status == AnimationStatus.completed){
      this.detailsController.reverse();
    }
  }

  Widget buildDetailsAnimation(){
    return AnimatedBuilder(
      animation: detailsAnimation,
      builder: (context, child) {
        return Stack(
          children: [
            Opacity(
              opacity: detailsAnimation.value,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height-80,
              color: Colors.grey,
            )
            ),
            Positioned(
              child: BrandColorDisplay(onPressed: onTap),
              bottom: 16 + detailsAnimation.value*470,
            ),
            Positioned(
              child: ColorGrid(),
              left: 700 - detailsAnimation.value*700,
              bottom: 0,
            ),
          ]
        );
      },
    );
  }
}