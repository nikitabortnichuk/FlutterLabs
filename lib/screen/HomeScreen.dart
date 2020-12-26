import 'package:chwitter/component/Chweets.dart';
import 'package:chwitter/component/ChwitterDrawer.dart';
import 'package:chwitter/component/Likes.dart';
import 'package:chwitter/component/Notifications.dart';
import 'package:chwitter/component/Search.dart';
import 'package:chwitter/di/DI.dart';
import 'package:chwitter/model/Chweet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  final List<Chweet> chweets;
  final List<Chweet> likedChweets;
  final Function addToLiked;
  final Function removeFromLiked;

  HomeScreen(
      {@required this.chweets,
      @required this.likedChweets,
      @required this.addToLiked,
      @required this.removeFromLiked});

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
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
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
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/menu.svg",
              width: 24,
              height: 24,
            ),
            onPressed: () {
              return null;
            },
          )
        ],
      ),
      drawer: ChwitterDrawer(),
      body: PageView(
        children: [
          Chweets(
              chweets: widget.chweets,
              addToLiked: widget.addToLiked,
              removeFromLiked: widget.removeFromLiked),
          Search(),
          Notifications(),
          Likes(
              likedChweets: widget.likedChweets,
              addToLiked: widget.addToLiked,
              removeFromLiked: widget.removeFromLiked)
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
