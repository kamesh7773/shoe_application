import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_application/provider/cart_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).popAndPushNamed("/MainPage");
          },
        ),
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: Consumer<CartProvider>(builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.cart.length,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            // varible declaration
            final shoeImage = value.cart[index]["shoeImage"];
            final shoeTitle = value.cart[index]["shoeTitle"];
            final shoeSize = value.cart[index]["shoeSize"];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                tileColor: const Color.fromARGB(255, 231, 238, 243),
                leading: CircleAvatar(
                  child: Image.asset(shoeImage),
                ),
                title: Text(
                  shoeTitle,
                  style: const TextStyle(fontSize: 15),
                ),
                subtitle: Text(
                  "Size : $shoeSize",
                  style: const TextStyle(fontSize: 12),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Delete Product",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          content: Text(
                            "Are you sure you want to remove this product ?",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                // removing product from cart
                                context
                                    .read<CartProvider>()
                                    .removeFromCart(index);
                                Navigator.of(context).pop();
                                // Showing the snakeBar
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(milliseconds: 500),
                                    behavior: SnackBarBehavior.floating,
                                    content: Text("Product remove from cart"),
                                  ),
                                );
                              },
                              child: const Text(
                                "yes",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "no",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  color: Colors.red,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
