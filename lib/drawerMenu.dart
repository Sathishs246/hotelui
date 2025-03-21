import 'package:flutter/material.dart';
import 'package:hotelui/colors.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.blue, PrimaryColor],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Material(
        color: Colors.transparent,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: Text("G", style: TextStyle(fontSize: 35)),
                ),
                decoration: BoxDecoration(color: Colors.transparent),
                accountName: Text("Google "),
                accountEmail: Text("google@gmail.com")),
            MenuList(
              title: "Orders",
              iconName: Icons.border_color,
            ),
            MenuList(
              title: "Address",
              iconName: Icons.bookmark,
            ),
            MenuList(
              title: "Notification",
              iconName: Icons.notifications,
            ),
            MenuList(
              title: "Help",
              iconName: Icons.help,
            ),
            MenuList(
              title: "About",
              iconName: Icons.account_box,
            ),
            MenuList(title: "Rate us", iconName: Icons.rate_review),
            MenuList(
              title: "Log Out",
              iconName: Icons.exit_to_app,
            ),
          ],
        ),
      ),
    );
  }
}

class MenuList extends StatelessWidget {
  final String title;
  final IconData iconName;

  const MenuList({required this.title, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white24, borderRadius: BorderRadius.circular(10)),
          child: Icon(
            iconName,
            color: Colors.white,
          )),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
