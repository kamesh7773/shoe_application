import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_application/provider/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final String shoeTitle;
  final String shoeImage;
  final String shoePrice;
  final List shoeSizeList;
  const ProductDetailsPage({
    super.key,
    required this.shoeTitle,
    required this.shoeImage,
    required this.shoePrice,
    required this.shoeSizeList,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  // varible declaration
  int? selectSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          "Details",
          style: TextStyle(fontSize: 19),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            widget.shoeTitle,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Image.asset(widget.shoeImage),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(216, 240, 253, 1),
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(25),
                right: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Text(
                    "\$ ${widget.shoePrice}",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 20),
                  StatefulBuilder(
                    builder: (context, myStatefunc) {
                      return SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.shoeSizeList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  myStatefunc(() {
                                    selectSize = index;
                                  });
                                },
                                child: Chip(
                                  backgroundColor: selectSize == index
                                      ? Theme.of(context).primaryColor
                                      : const Color.fromRGBO(245, 247, 249, 1),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14),
                                  label: Text(
                                    widget.shoeSizeList[index].toString(),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      foregroundColor: Colors.black,
                      backgroundColor: Theme.of(context).primaryColor,
                      fixedSize: const Size(380, 50),
                    ),
                    // Method for Adding Product to the Cart
                    onPressed: () {
                      if (selectSize != null) {
                        // Adding Product to Cart
                        context.read<CartProvider>().addToCart({
                          "shoeImage": widget.shoeImage,
                          "shoeTitle": widget.shoeTitle,
                          "shoeSize": widget.shoeSizeList[selectSize!],
                        });
                        // Showing SnackBar
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Product addred cart succesfully"),
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(milliseconds: 500),
                          ),
                        );
                      } else {
                        // Showing SnackBar
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please Select shoe size"),
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(milliseconds: 500),
                          ),
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.shopping_cart_outlined),
                        Text(
                          "Add to Cart",
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
