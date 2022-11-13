import 'package:ecommerce_mobile/services/auth.dart';
import 'package:ecommerce_mobile/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final formKey=GlobalKey<FormState>();
  final nameController=TextEditingController();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final passwordConfirmationController=TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
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
                Text('Register to Ecommerce',style: TextStyle(color: Colors.grey[600],fontSize: 23,fontFamily: 'Pacifico'),),
                SizedBox(height: 30),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'name',
                    hintText: 'jhon doe',
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
                SizedBox(height:30),
                TextFormField(
                  controller: passwordConfirmationController,
                  obscureText:true,
                  decoration: InputDecoration(
                    labelText: 'password confirmation',
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
                SizedBox(height: 30),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 50,
                  color: Color(0Xff43db80),
                  textColor: Colors.white,
                  onPressed: (){
                    Map creds={
                      'name':nameController.text,
                      'email':emailController.text,
                      'password':passwordController.text,
                      'password_confirmation':passwordConfirmationController.text
                    };
                    Provider.of<Auth>(context,listen:false).register(creds);
                    Provider.of<Auth>(context,listen:false).login({'email':emailController.text,'password':passwordController.text});
                    Navigator.of(context).pop();
                  },
                  child: Text('Register',style: TextStyle(fontSize: 18),),
                )
              ], 
            )
          ),
        ),
      ),
    );
  }
}