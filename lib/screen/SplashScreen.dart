import 'package:chwitter/screen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    _fakeLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset("assets/icons/logo_colored.svg",
          width: 48,
          height: 48,
        ),
      ),
    );
  }

  void _fakeLoad() async {
    await Future.delayed(Duration(seconds: 2));
    var route = MaterialPageRoute(builder: (context) => HomeScreen());
    Navigator.of(context).pushAndRemoveUntil(route, (route) => false);
  }
}
