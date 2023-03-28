import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('Duy'),
              accountEmail: Text('abc@gmail.com'),
              currentAccountPicture: ClipOval(
                  child: Image.network(
                    'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2021/8/15/photo-1629016090148-1629016090266456871612.jpg',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
              ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: NetworkImage(
                    'https://sudospaces.com/vietchem-com-vn/2022/08/thien-nhien-2.jpg'),
                fit: BoxFit.cover,
              )
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
            onTap: ()=>null,
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Favorites'),
            onTap: ()=>null,
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Favorites'),
            onTap: ()=>null,
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Favorites'),
            onTap: ()=>null,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Favorites'),
            onTap: ()=>null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app_outlined),
            title: Text('Favorites'),
            onTap: ()=>null,
          ),
        ],
      ),
    );
  }
}