import 'package:flutter/material.dart';
import 'package:store_app/constant/constant.dart';
import 'package:store_app/models/product_modle.dart';
import 'package:store_app/services/get_all_product.dart';

import '../widget/custom_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static String id = "HomeView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ))
        ],
        centerTitle: true,
        title: const Text(
          "New Trend",
          style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductServices().getAllProduct(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.6,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 75),
                  itemBuilder: (context, index) {
                    return CustomCard(
                      product: products[index],
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
        ),
      ),
    );
  }
}
