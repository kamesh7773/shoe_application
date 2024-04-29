import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
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
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: widget.index.isEven
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
              widget.shoeTitle,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "\$ ${widget.shoePrice}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Center(
              child: Image.asset(
                widget.shoeImage,
                height: 175,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
