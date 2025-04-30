import 'package:flutter/material.dart';
import 'package:store_app/view/home_page.dart';
import 'package:store_app/view/update_product.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeView.id: (context) => HomeView(),
        UpdateProductView.id: (context) => UpdateProductView(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: HomeView.id,
    );
  }
}
