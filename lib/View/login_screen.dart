import 'package:flutter/material.dart';
import 'package:sotre_app/Widgets/Email_Field.dart';
import 'package:sotre_app/Widgets/Login_Button.dart';
import 'package:sotre_app/Widgets/Password_Field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
       final height = MediaQuery.of(context).size.height;
       final width = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.08,
              width: width * 0.20,
              child: Image.asset("assets/logo.png"),
            ),
             SizedBox(height: height * 0.03),
         EmailField(),
          SizedBox(height: height * 0.03,),
          PasswordField(),
           SizedBox(height: height * 0.05),
           LoginButton()
          ],
        ),
      ),
    );
  }
}