import 'package:chwitter/component/ChwitterDrawerHeader.dart';
import 'package:chwitter/component/DrawerItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChwitterDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ChwitterDrawerHeader(
              image: "assets/icons/avatar.jpg",
              account: "bort1k13",
              name: "Nikita Bortnichuk",
              followers: 64,
              followings: 113,
            ),
            Divider(),
            DrawerItem(
              icon: "assets/icons/user.svg",
              label: "Profile",
            ),
            DrawerItem(
              icon: "assets/icons/list.svg",
              label: "Lists",
            ),
            DrawerItem(
              icon: "assets/icons/hashtag.svg",
              label: "Topics",
            ),
            DrawerItem(
              icon: "assets/icons/bookmark.svg",
              label: "Liked chweets",
            ),
            DrawerItem(
              icon: "assets/icons/lighting.svg",
              label: "Moments",
            ),
            Divider(),
            DrawerItem(
              icon: "assets/icons/ads.svg",
              label: "Chwitter Ads",
            ),
            Divider(),
            DrawerItem(
              label: "Configuration",
            ),
            DrawerItem(
              label: "Help desk",
            ),
          ],
        ),
      ),
    );
  }
}
