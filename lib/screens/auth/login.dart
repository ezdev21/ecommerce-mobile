import 'package:ecommerce_mobile/provider/auth_provider.dart';
import 'package:ecommerce_mobile/screens/auth/password_reset.dart';
import 'package:ecommerce_mobile/screens/auth/register.dart';
import 'package:ecommerce_mobile/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical:30,horizontal:5),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text('Login to Ecommerce',style: TextStyle(color: Colors.grey[600],fontSize: 23,fontFamily: 'Pacifico'),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("don't have an account?"),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: Text('sign up',style: TextStyle(color:Color(0Xff43db80)),),
                        onTap:(){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>Register()));
                        }
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'email',
                    hintText: 'jhondoe@gmail.com',
                    fillColor:Colors.white,
                    filled:true,
                    contentPadding: EdgeInsets.all(3),
                    enabledBorder: OutlineInputBorder(
                      borderSide:BorderSide(width: 2,color: Colors.grey.shade400),
                      borderRadius:BorderRadius.circular(5)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:BorderSide(width: 2,color: Color(0Xff43db80)),
                      borderRadius:BorderRadius.circular(5)
                    ),
                  ),
                ),
                SizedBox(height:30),
                TextFormField(
                  controller: passwordController,
                  obscureText:true,
                  decoration: InputDecoration(
                    labelText: 'password',
                    hintText: '********',
                    fillColor:Colors.white,
                    filled:true,
                    contentPadding: EdgeInsets.all(3),
                    enabledBorder: OutlineInputBorder(
                      borderSide:BorderSide(width: 2,color: Colors.grey.shade400),
                      borderRadius:BorderRadius.circular(5)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:BorderSide(width: 2,color: Color(0Xff43db80)),
                      borderRadius:BorderRadius.circular(5)
                    ),
                  ),
                ),
                SizedBox(height: 10),
                MaterialButton(
                  textColor:Color(0Xff43db80),
                  child: Text('forgot password?'),
                  onPressed:() {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>PasswordReset()));
                  }
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 50,
                  color: Color(0Xff43db80),
                  textColor: Colors.white,
                  onPressed: (){
                    Map creds={
                      'email':emailController.text,
                      'password':passwordController.text,
                      'device_name':Provider.of<AuthProvider>(context,listen:false).getDeviceInfo()
                    };
                    Provider.of<AuthProvider>(context,listen:false).login(creds);
                    Navigator.of(context).pop();
                  },
                  child: Text('Login',style: TextStyle(fontSize: 18),),
                )
              ], 
            )
          ),
        ),
      ),
    );
  }
}