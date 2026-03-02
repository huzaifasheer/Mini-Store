import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotre_app/Widgets/Custom_app_Bar.dart';

import '../View_Model/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(title: "My Cart"),
        body: cart.items.isEmpty
            ? const Center(child: Text("Cart is empty"))
            : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final item = cart.items[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Material(
                      elevation: 4, // shadow for elevation
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            /// Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                item.image,
                                width: 60,
                                height: 60,
                                fit: BoxFit.contain,
                              ),
                            ),
      
                            const SizedBox(width: 12),
      
                            /// Title & Price
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "\$${item.price}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
      
                            /// Delete Button
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
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
