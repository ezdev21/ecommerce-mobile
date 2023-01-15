import 'package:ecommerce_mobile/provider/auth_provider.dart';
import 'package:ecommerce_mobile/screens/auth/login.dart';
import 'package:ecommerce_mobile/screens/auth/register.dart';
import 'package:ecommerce_mobile/screens/category/category_show.dart';
import 'package:ecommerce_mobile/screens/home_page.dart';
import 'package:ecommerce_mobile/screens/product/product_create.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_mobile/screens/product/product_show.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Consumer<AuthProvider>(builder:(context,auth,child){
        return !auth.authenticated ?
        ListView(
          children: [
            ListTile(
              title: const Text('Home'),
              leading: const Icon(Icons.home),
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomePage()))
              },
            ),
            ListTile(
              title: const Text('Sell'),
              leading: const Icon(Icons.add),
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ProductCreate()))
              },
            ),
            ListTile(
              title: const Text('Login'),
              leading: const Icon(Icons.login),
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Login()))
              },
            ),
            ListTile(
              title: const Text('Register'),
              leading: const Icon(Icons.app_registration),
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Register()))
              },
            ),
            ListTile(
              title: const Text('Show'),
              leading: const Icon(Icons.add),
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ProductShow()))
              },
            ),
            ListTile(
            title: const Text('category'),
            leading: const Icon(Icons.category),
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const CategoryShow()))
            },
          )
          ],
        )
        :ListView(
        children: [
          DrawerHeader(
            decoration:const BoxDecoration(
              color: Color(0Xff43db80)
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                const SizedBox(height: 10,),
                Text(auth.user!.name,style: const TextStyle(color: Colors.white),),
                Text(auth.user!.name,style: const TextStyle(color: Colors.white),),
                const SizedBox(height: 10,),
              ],
            ),
          ),
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.logout),
            onTap: () => {
              Provider.of<AuthProvider>(context,listen: false).logout()
              //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()))
            },
          )
        ],
      );
      })
    );
  }
}