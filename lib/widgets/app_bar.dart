import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Text(
            "Shoes\nCollection",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: TextField(
            // text feild style
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(23),
              // border properties
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(50),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 50, 48, 48),
                ),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(50),
                ),
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Color.fromARGB(255, 154, 149, 149),
              ),
              hintText: "Search",
            ),
          ),
        )
      ],
    );
  }
}
