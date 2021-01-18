import 'package:flutter/material.dart';

class AnimationWidget extends StatelessWidget {
  final AnimationController animationController;
  final Animation<Color> animationColor;
  final Animation<double> animationHeight;

  AnimationWidget({Key key, this.animationController, this.animationColor, this.animationHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, widget) => Container(
        width: 50,
        height: animationHeight.value,
        color: animationColor.value,
      ),
      animation: animationController,
    );
  }
}
