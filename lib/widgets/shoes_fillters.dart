import 'package:flutter/material.dart';

class ShoesBrandsFillters extends StatefulWidget {
  const ShoesBrandsFillters({super.key});

  @override
  State<ShoesBrandsFillters> createState() => _ShoesBrandsFilltersState();
}

class _ShoesBrandsFilltersState extends State<ShoesBrandsFillters> {
  // Varible Declaration
  int selectIndex = 0;
  List<String> shoedBrands = ["All", "Adidas", "Nike", "Bata"];

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, myStatefunc) {
        return SizedBox(
          height: 75,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: shoedBrands.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  myStatefunc(() {
                    selectIndex = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Chip(
                    backgroundColor: selectIndex == index
                        ? Theme.of(context).primaryColor
                        : const Color.fromRGBO(245, 247, 249, 1),
                    label: Text(
                      shoedBrands[index],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 18,
                    ),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color.fromRGBO(230, 231, 233, 1),
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
