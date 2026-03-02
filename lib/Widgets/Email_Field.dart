import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  const EmailField({super.key});

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          TextDirection.rtl, // Full RTL: hint + icon start from right
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: "أدخل بريدك الإلكتروني", // Arabic hint
          prefixIcon: const Icon(Icons.email_outlined), // now on the right
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 16,
          ),
        ),
      ),
    );
  }
}
