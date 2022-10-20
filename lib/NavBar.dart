
import 'package:flutter/material.dart';
import 'package:testproject/screen/login_signup.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('HaiderAli'),
            accountEmail: Text('haiderali_zaidi@outlook.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                // child: Image.network(
                //   'https://www.nicepng.com/maxp/u2q8o0a9u2e6/e6y3',
                //   fit: BoxFit.cover,
                //   width: 90,
                //   height: 90,
                // ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://rare-gallery.com/352962-4k-wallpaper.html')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Friends'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Request'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Policies'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Text('Exit'),
            leading: Icon(Icons.exit_to_app),
              onTap: () {
              Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginSignupScreen();
                    },
                  ),
                );
   },
           // onTap: () => null,
          ),
        ],
      ),
    );
  }
}