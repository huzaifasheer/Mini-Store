import 'package:flutter/material.dart';
import 'package:sotre_app/View/product_list_screen.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductListScreen()),
          );
        },
        child: Container(
          height: height * 0.05,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Directionality(
              textDirection: TextDirection.rtl, // Right-to-left
              child: Text(
                "تسجيل الدخول", // Arabic for "Login"
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
