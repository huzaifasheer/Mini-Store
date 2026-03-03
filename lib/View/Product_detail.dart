import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotre_app/Widgets/Custom_app_Bar.dart';
import 'package:sotre_app/view_models/cart_provider.dart';
import '../models/product_model.dart';

/* Product detail screen*/

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(title: "Product Detail"),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenWidth * 0.05,
            ),
            child: isTablet
                ? _buildTabletLayout(context, screenWidth)
                : _buildMobileLayout(context, screenWidth),
          ),
        ),
      ),
    );
  }

  /// ================= MOBILE LAYOUT =================
  Widget _buildMobileLayout(BuildContext context, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// Product Image
        SizedBox(
          height: width * 0.65,
          width: width * 0.65,
          child: Image.network(product.image, fit: BoxFit.contain),
        ),

        SizedBox(height: width * 0.06),

        _buildDetailsCard(context, width),
      ],
    );
  }

  /// ================= TABLET LAYOUT =================
  Widget _buildTabletLayout(BuildContext context, double width) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Image Section
        Expanded(
          flex: 1,
          child: SizedBox(
            height: width * 0.4,
            child: Image.network(product.image, fit: BoxFit.contain),
          ),
        ),

        SizedBox(width: width * 0.05),

        /// Details Section
        Expanded(flex: 1, child: _buildDetailsCard(context, width)),
      ],
    );
  }

  /// ================= DETAILS CARD =================
  Widget _buildDetailsCard(BuildContext context, double width) {
    final isTablet = width > 600;

    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(width * 0.05),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            Text(
              product.title,
              style: TextStyle(
                fontSize: isTablet ? width * 0.025 : width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: width * 0.04),

            /// Description
            Text(
              product.description,
              style: TextStyle(
                fontSize: isTablet ? width * 0.020 : width * 0.040,
                color: Colors.grey[700],
              ),
            ),

            SizedBox(height: width * 0.06),

            /// Price + Add To Cart
            Row(
              children: [
                /// Price Tag
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                    vertical: width * 0.025,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontSize: isTablet ? width * 0.022 : width * 0.042,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const Spacer(),

                /// Add to Cart Button
                InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    Provider.of<CartProvider>(
                      context,
                      listen: false,
                    ).addToCart(product);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Added to cart")),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.06,
                      vertical: width * 0.03,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Add to Cart",
                          style: TextStyle(
                            fontSize: isTablet ? width * 0.020 : width * 0.038,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: width * 0.02),
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: isTablet ? width * 0.022 : width * 0.045,
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
    );
  }
}
