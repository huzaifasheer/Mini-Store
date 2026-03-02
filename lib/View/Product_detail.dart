import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotre_app/Widgets/Custom_app_Bar.dart';
import 'package:sotre_app/vew_models/cart_provider.dart';
import '../models/product_model.dart';

/* Product detail screen*/

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(title: "Product Detail"),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: width * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// 🔹 Responsive Image
                SizedBox(
                  height: width * 0.6,
                  width: width * 0.6,
                  child: Image.network(product.image, fit: BoxFit.contain),
                ),

                SizedBox(height: width * 0.05),

                /// 🔹 Details Card
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(width * 0.05),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Title
                        Text(
                          product.title,
                          style: TextStyle(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: width * 0.04),

                        /// Description
                        Text(
                          product.description,
                          style: TextStyle(
                            fontSize: width * 0.038,
                            color: Colors.grey[700],
                          ),
                        ),

                        SizedBox(height: width * 0.06),

                        /// Price + Button Row
                        Row(
                          children: [
                            /// Price Tag
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: width * 0.04,
                                vertical: width * 0.02,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                "\$${product.price}",
                                style: TextStyle(
                                  fontSize: width * 0.04,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            const Spacer(),

                            /// Add to Cart Button
                            InkWell(
                              onTap: () {
                                Provider.of<CartProvider>(
                                  context,
                                  listen: false,
                                ).addToCart(product);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Added to cart"),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.05,
                                  vertical: width * 0.025,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Add to Cart",
                                      style: TextStyle(
                                        fontSize: width * 0.038,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: width * 0.02),
                                    const Icon(
                                      Icons.shopping_cart,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
