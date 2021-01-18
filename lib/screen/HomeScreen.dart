import 'package:chwitter/component/AnimationDiagram.dart';
import 'package:chwitter/component/Chweets.dart';
import 'package:chwitter/component/ChwitterDrawer.dart';
import 'package:chwitter/component/Likes.dart';
import 'package:chwitter/component/Movies.dart';
import 'package:chwitter/model/ChweetListModel.dart';
import 'package:chwitter/model/ThemePreference.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentScreen = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentScreen);
    final chweetsListModel = Provider.of<ChweetListModel>(context, listen: false);
    chweetsListModel.getData();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemePreference>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: SvgPicture.asset(
          "assets/icons/logo_colored.svg",
          width: 24,
          height: 24,
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return _gestureDetector(context);
          },
        ),
        actions: [
          Switch(
            value: themeChange.value,
            onChanged: (bool value) {
              themeChange.value = value;
            },
            activeColor: Color(0xFF1744).withOpacity(1.0),
          )
        ],
      ),
      drawer: ChwitterDrawer(),
      body: PageView(
        children: [
          Chweets(),
          AnimationDiagram(),
          Movies(),
          Likes()
        ],
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentScreen,
        onTap: onTabTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _currentScreen == 0
                    ? "assets/icons/home_colored.svg"
                    : "assets/icons/home.svg",
                width: 24,
                height: 24,
              ),
              title: Text("")),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _currentScreen == 1
                    ? "assets/icons/search_colored.svg"
                    : "assets/icons/search.svg",
                width: 24,
                height: 24,
              ),
              title: Text("")),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _currentScreen == 2
                    ? "assets/icons/bell_colored.svg"
                    : "assets/icons/bell.svg",
                width: 24,
                height: 24,
              ),
              title: Text("")),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _currentScreen == 3
                    ? "assets/icons/like_colored.svg"
                    : "assets/icons/like.svg",
                width: 24,
                height: 24,
              ),
              title: Text("")),
        ],
      ),
    );
  }

  GestureDetector _gestureDetector(BuildContext context) {
    return GestureDetector(
      onTap: () => Scaffold.of(context).openDrawer(),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(200)),
          child: Image.asset("assets/icons/avatar.jpg"),
        ),
      ),
    );
  }

  void onPageChanged(int index) {
    setState(() {
      _currentScreen = index;
    });
  }

  void onTabTapped(int index) {
    _pageController.jumpToPage(index);
  }

}
