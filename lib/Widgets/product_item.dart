import 'package:flutter/material.dart';
import '../models/product_model.dart';

/* Product item*/
class ProductItem extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductItem({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: width * 0.02,
        ),
        child: Card(
          color: Colors.white,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.all(width * 0.03),
            child: Row(
              children: [
                // 🔹 Responsive Image
                SizedBox(
                  height: width * 0.18,
                  width: width * 0.18,
                  child: Image.network(product.image, fit: BoxFit.contain),
                ),

                SizedBox(width: width * 0.04),

                // 🔹 Text Section
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.04, // responsive font
                        ),
                      ),

                      SizedBox(height: width * 0.02),

                      Text(
                        "\$${product.price}",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: width * 0.038,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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
