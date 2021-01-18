import 'package:chwitter/component/AnimationWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimationDiagram extends StatefulWidget {
  @override
  _AnimationDiagramState createState() => _AnimationDiagramState();
}

class _AnimationDiagramState extends State<AnimationDiagram>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation1;
  Animation<double> _animation2;
  Animation<double> _animation3;
  Animation<double> _animation4;
  Animation<double> _animation5;
  Animation<Color> _colorAnimation1;
  Animation<Color> _colorAnimation2;
  Animation<Color> _colorAnimation3;
  Animation<Color> _colorAnimation4;
  Animation<Color> _colorAnimation5;

  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _animationController
        .addStatusListener((status) => _controllerListener(status));
    _animation1 =
        Tween<double>(begin: 0, end: 250).animate(_animationController);
    _animation2 =
        Tween<double>(begin: 100, end: 400).animate(_animationController);
    _animation3 =
        Tween<double>(begin: 150, end: 0).animate(_animationController);
    _animation4 =
        Tween<double>(begin: 200, end: 150).animate(_animationController);
    _animation5 =
        Tween<double>(begin: 50, end: 350).animate(_animationController);
    _colorAnimation1 = ColorTween(begin: Colors.red, end: Colors.blue)
        .animate(_animationController);
    _colorAnimation2 = ColorTween(begin: Colors.white, end: Colors.purple)
        .animate(_animationController);
    _colorAnimation3 = ColorTween(begin: Colors.black, end: Colors.redAccent)
        .animate(_animationController);
    _colorAnimation4 = ColorTween(begin: Colors.yellow, end: Colors.green)
        .animate(_animationController);
    _colorAnimation5 = ColorTween(begin: Colors.cyanAccent, end: Colors.pink)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: AnimationWidget(
                      animationController: _animationController,
                      animationColor: _colorAnimation1,
                      animationHeight: _animation1)),
              Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: AnimationWidget(
                      animationController: _animationController,
                      animationColor: _colorAnimation2,
                      animationHeight: _animation2)),
              Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: AnimationWidget(
                      animationController: _animationController,
                      animationColor: _colorAnimation3,
                      animationHeight: _animation3)),
              Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: AnimationWidget(
                      animationController: _animationController,
                      animationColor: _colorAnimation4,
                      animationHeight: _animation4)),
              Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: AnimationWidget(
                      animationController: _animationController,
                      animationColor: _colorAnimation5,
                      animationHeight: _animation5))
            ],
          ),
          FlatButton(
            textColor: Colors.white,
            color: Colors.blue,
            onPressed: () {
              _isPlaying ?
              _animationController.stop() :
              _animationController.forward();
              setState(() {
                _isPlaying = !_isPlaying;
              });
            },
            child: Text(
              _isPlaying ? "Stop Animation" : "Start Animation",
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }

  void _controllerListener(status) {
    if (status == AnimationStatus.completed) {
      _animationController.reverse();
    } else if (status == AnimationStatus.dismissed) {
      _animationController.forward();
    }
  }
}
