import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const  imageURl = "";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
             DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                // decoration: BoxDecoration(
                //   color: Colors.red,
                // ),
                accountName: const Text("Vi Dharia"),
                accountEmail: const Text("vihaandharia04@gmail.com"),
                currentAccountPicture: 
                Image.network(imageURl),
                // CircleAvatar(backgroundImage: NetworkImage(imageURl)),
              ),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.home,
              color: Colors.white),
              title: Text("Home", textScaleFactor: 1.2, style: TextStyle(color: Colors.white))
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.profile_circled,
              color: Colors.white),
              title: Text("Profile", textScaleFactor: 1.2, style: TextStyle(color: Colors.white))
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.mail,
              color: Colors.white),
              title: Text("Email me", textScaleFactor: 1.2, style: TextStyle(color: Colors.white))
            ),
            
          ],
        ),
      ),
    );
  }
}
