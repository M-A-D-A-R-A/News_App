import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl ="https://www.nawpic.com/media/2020/madara-uchiha-nawpic-13.jpg";
    return Drawer(
      child: Container(
        color: Colors.redAccent,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                arrowColor: Colors.red,
                margin: EdgeInsets.zero,
                accountName: Text("Nishant Andoriya"),
                accountEmail: Text("andoriyanishant@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
              )),
              ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                title: Text(
                  "Home",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                ),
                title: Text(
                  "profile",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                 Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
                title: Text(
                  "Sign Out",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}