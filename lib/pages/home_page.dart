import 'package:flutter/material.dart';
import 'package:shoe_application/widgets/app_bar.dart';
import 'package:shoe_application/widgets/list_of_shoes.dart';
import 'package:shoe_application/widgets/shoes_fillters.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Custom AppBar
            CustomAppBar(),
            SizedBox(height: 10),
            // Shoes Brand fillter
            ShoesBrandsFillters(),
            // List of Products
            ListOfShoes()
          ],
        ),
      ),
    );
  }
}
