import 'package:flutter/material.dart';
import 'package:shoe_application/pages/product_details.dart';
import 'package:shoe_application/provider/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:shoe_application/widgets/product_card.dart';

class ListOfShoes extends StatefulWidget {
  const ListOfShoes({super.key});

  @override
  State<ListOfShoes> createState() => _ListOfShoesState();
}

class _ListOfShoesState extends State<ListOfShoes> {
  @override
  Widget build(BuildContext context) {
    // varible declration
    final products = context.watch<ProductProvider>().products;

    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          // If Screen Size Greater then 650 pixel width
          if (constraints.maxWidth > 650) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 0,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: products.length,
              itemBuilder: (context, index) {
                // varibles declarations
                final shoeTitle = products[index]["title"];
                final shoePrice = products[index]["price"].toString();
                final shoeImage = products[index]["imageUrl"];
                final shoeSizeList = products[index]["sizes"];

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailsPage(
                            shoeTitle: shoeTitle,
                            shoeImage: shoeImage,
                            shoePrice: shoePrice,
                            shoeSizeList: shoeSizeList,
                          );
                        },
                      ),
                    );
                  },
                  child: ProductCard(
                    index: index,
                    shoeTitle: shoeTitle,
                    shoePrice: shoePrice,
                    shoeImage: shoeImage,
                  ),
                );
              },
            );
          } else {
            // If Screen Size Lower then 650 pixel width
            return ListView.builder(
              itemCount: products.length,
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 10,
              ),
              itemBuilder: (context, index) {
                // varibles declarations
                final shoeTitle = products[index]["title"];
                final shoePrice = products[index]["price"].toString();
                final shoeImage = products[index]["imageUrl"];
                final shoeSizeList = products[index]["sizes"];

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailsPage(
                            shoeTitle: shoeTitle,
                            shoeImage: shoeImage,
                            shoePrice: shoePrice,
                            shoeSizeList: shoeSizeList,
                          );
                        },
                      ),
                    );
                  },
                  child: ProductCard(
                    index: index,
                    shoeTitle: shoeTitle,
                    shoePrice: shoePrice,
                    shoeImage: shoeImage,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
