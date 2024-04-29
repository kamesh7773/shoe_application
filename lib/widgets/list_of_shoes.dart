import 'package:flutter/material.dart';
import 'package:shoe_application/pages/product_details.dart';
import 'package:shoe_application/provider/product_provider.dart';
import 'package:provider/provider.dart';

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
          // -----------------------------------------------------
          // If Screen Size Greater then 650 pixel width (Desktop)
          // -----------------------------------------------------
          if (constraints.maxWidth > 650) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // Image will not resize and go out of render flex pixel
                childAspectRatio: (1 / 1),
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
                  // ------------
                  // Product Card
                  // ------------
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: index.isEven
                          ? const Color.fromRGBO(216, 240, 253, 1)
                          : const Color.fromARGB(255, 234, 236, 239),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            shoeTitle,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            "\$ $shoePrice",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Center(
                            child: Image.asset(
                              shoeImage,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          // -----------------------------------------------------------
          // If Screen Size Lower then 650 pixel width (Mobile / Tablet)
          // -----------------------------------------------------------
          else {
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
                  // ------------
                  // Product Card
                  // ------------
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: index.isEven
                          ? const Color.fromRGBO(216, 240, 253, 1)
                          : const Color.fromARGB(255, 234, 236, 239),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            shoeTitle,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            "\$ $shoePrice",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Center(
                            child: Image.asset(
                              shoeImage,
                              height: 175,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
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



// Center(
//                             child: Image.asset(
//                               shoeImage,
//                               height: 175,
//                               fit: BoxFit.cover,
//                             ),
//                           )