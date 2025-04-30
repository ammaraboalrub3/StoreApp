import 'package:flutter/material.dart';
import 'package:store_app/models/product_modle.dart';
import 'package:store_app/view/update_product.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.product, super.key});

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductView.id, arguments: product);
      },
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 237, 237, 237),
              spreadRadius: 1,
              blurRadius: 10,
            )
          ], color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  product.title.substring(0, 10),
                  style: const TextStyle(color: Colors.grey),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(r"$" "${product.price.toString()}"),
                    const SizedBox(
                      width: 55,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.grey,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 15,
          bottom: 75,
          child: Image.network(
            product.image,
            height: 100,
            width: 100,
          ),
        )
      ]),
    );
  }
}
