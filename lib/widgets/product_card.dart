import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final int index;
  final String shoeTitle;
  final String shoePrice;
  final String shoeImage;

  const ProductCard({
    super.key,
    required this.index,
    required this.shoeTitle,
    required this.shoePrice,
    required this.shoeImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.width * 0.25,
                // fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
