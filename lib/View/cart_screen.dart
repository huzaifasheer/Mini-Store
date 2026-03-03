import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotre_app/Widgets/Custom_app_Bar.dart';
import 'package:sotre_app/view_models/cart_provider.dart';

/* Cart Screen*/

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(title: "My Cart"),
        body: cart.items.isEmpty
            ? Center(
                child: Text(
                  "Cart is empty",
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.all(screenWidth * 0.04),
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final item = cart.items[index];

                  final imageSize = isTablet
                      ? screenWidth * 0.10
                      : screenWidth * 0.18;

                  final titleFontSize = isTablet
                      ? screenWidth * 0.025
                      : screenWidth * 0.040;

                  final priceFontSize = isTablet
                      ? screenWidth * 0.022
                      : screenWidth * 0.035;

                  final iconSize = isTablet
                      ? screenWidth * 0.030
                      : screenWidth * 0.060;

                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /// Product Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                item.image,
                                width: imageSize,
                                height: imageSize,
                                fit: BoxFit.contain,
                              ),
                            ),

                            SizedBox(width: screenWidth * 0.04),

                            /// Title & Price
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: titleFontSize,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: screenWidth * 0.015),
                                  Text(
                                    "\$${item.price}",
                                    style: TextStyle(
                                      fontSize: priceFontSize,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            /// Delete Button
                            IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: iconSize,
                              ),
                              onPressed: () {
                                cart.removeFromCart(item.id);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
