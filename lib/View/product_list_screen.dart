import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotre_app/View/Product_detail.dart';
import 'package:sotre_app/Widgets/Custom_app_Bar.dart';
import 'package:sotre_app/view_models/Product_view.dart';
import 'package:sotre_app/widgets/product_item.dart';

/*Product list Screen*/

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        /// Custom AppBar
        appBar: const CustomAppBar(title: "Product List"),

        body: Consumer<ProductViewModel>(
          builder: (context, vm, child) {
            if (vm.isLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.black),
              );
            }

            if (vm.errorMessage.isNotEmpty) {
              return Center(
                child: Text(
                  vm.errorMessage,
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
              );
            }

            /// ================= RESPONSIVE LAYOUT =================

            return Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: isTablet
                  ? _buildGridLayout(context, vm, screenWidth)
                  : _buildListLayout(context, vm),
            );
          },
        ),
      ),
    );
  }

  /// ================= MOBILE LIST =================
  Widget _buildListLayout(BuildContext context, ProductViewModel vm) {
    return ListView.builder(
      itemCount: vm.products.length,
      itemBuilder: (context, index) {
        final product = vm.products[index];

        return ProductItem(
          product: product,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductDetailScreen(product: product),
              ),
            );
          },
        );
      },
    );
  }

  /// ================= TABLET GRID =================
  Widget _buildGridLayout(
    BuildContext context,
    ProductViewModel vm,
    double width,
  ) {
    return GridView.builder(
      itemCount: vm.products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: width > 1000 ? 3 : 2,
        crossAxisSpacing: width * 0.04,
        mainAxisSpacing: width * 0.04,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final product = vm.products[index];

        return ProductItem(
          product: product,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductDetailScreen(product: product),
              ),
            );
          },
        );
      },
    );
  }
}
