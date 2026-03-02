import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotre_app/View/Product_detail.dart';
import 'package:sotre_app/Widgets/Custom_app_Bar.dart';
import 'package:sotre_app/vew_models/Product_view.dart';
import 'package:sotre_app/widgets/product_item.dart';

/*Product list Screen*/
class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        /* Custom App Bar*/
        appBar: CustomAppBar(title: "Product List"),
        body: Consumer<ProductViewModel>(
          builder: (context, vm, child) {
            if (vm.isLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.black),
              );
            }

            if (vm.errorMessage.isNotEmpty) {
              return Center(child: Text(vm.errorMessage));
            }
            //////////////////// Product List /////////////////////////
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
                        builder: (context) =>
                            ProductDetailScreen(product: product),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
