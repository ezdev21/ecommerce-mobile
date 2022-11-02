import 'package:ecommerce_mobile/screens/auth/login.dart';
import 'package:ecommerce_mobile/screens/auth/register.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                SizedBox(height: 10,),
                Text('John Doe',style: TextStyle(color: Colors.white),),
                Text('johndoe@gmail.com',style: TextStyle(color: Colors.white),),
                SizedBox(height: 10,),
              ],
            ),
            decoration:BoxDecoration(
              color: Color(0Xff43db80)
            )
          ),
          ListTile(
            title: Text('Login'),
            leading: Icon(Icons.login),
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()))
            },
          ),
          ListTile(
            title: Text('Register'),
            leading: Icon(Icons.logout),
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Register()))
            },
          )
        ],
      )
    );
  }
}