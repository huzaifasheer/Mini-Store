import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotre_app/View/Splash_Screen.dart';
import 'package:sotre_app/vew_models/Product_view.dart';
import 'package:sotre_app/vew_models/cart_provider.dart';

// import your ViewModel

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductViewModel()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Call fetchProducts once when app starts
    final productVM = Provider.of<ProductViewModel>(context, listen: false);
    productVM.fetchProducts(); /*API call + prints data in console*/

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
