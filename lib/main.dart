import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_application/pages/cart_page.dart';
import 'package:shoe_application/pages/home_page.dart';
import 'package:shoe_application/provider/cart_provider.dart';
import 'package:shoe_application/provider/product_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: const MainPage(),
    ),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // varible declration
  int currentPage = 0;
  List<Widget> screens = const [HomePage(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/MainPage": (context) => const MainPage(),
        "/HomePage": (context) => const HomePage(),
      },
      theme: ThemeData(
        // defining custom fonts
        fontFamily: "Lato",
        // defining colors
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(254, 206, 1, 1),
          primary: const Color.fromRGBO(254, 206, 1, 1),
        ),
        // Text Theme
        textTheme: const TextTheme(
          bodySmall: TextStyle(
            fontFamily: "Lato",
            fontWeight: FontWeight.normal,
          ),
          bodyMedium: TextStyle(
            fontFamily: "Lato",
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
          bodyLarge: TextStyle(
            fontFamily: "Lato",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          displayLarge: TextStyle(
            fontFamily: "Lato",
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      home: Scaffold(
        body: IndexedStack(
          index: currentPage,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          currentIndex: currentPage,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
