import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_modle.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widget/custom_butoom.dart';
import 'package:store_app/widget/custom_textField.dart';

class UpdateProductView extends StatefulWidget {
  const UpdateProductView({super.key});

  static String id = "UpdateProductView";

  @override
  State<UpdateProductView> createState() => _UpdateProductViewState();
}

class _UpdateProductViewState extends State<UpdateProductView> {
  String? productNAme, desc, image;

  var price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Update Product",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              CustomTextFormField(
                  onChange: (data) {
                    productNAme = data;
                  },
                  hint: "product name..."),
              CustomTextFormField(
                  onChange: (data) {
                    desc = data;
                  },
                  hint: "Descriptoin..."),
              CustomTextFormField(
                  inputType: TextInputType.number,
                  onChange: (data) {
                    price = data;
                  },
                  hint: "Price..."),
              CustomTextFormField(
                  onChange: (data) {
                    image = data;
                  },
                  hint: "Image..."),
              const SizedBox(
                height: 25,
              ),
              CustomButon(
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    await updateProduct(product);
                    try {
                      print("secssess");
                    } catch (e) {
                      print(e.toString());
                    }

                    isLoading = false;
                    setState(() {});
                  },
                  text: "Update")
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id,
        title: productNAme == null ? product.title : productNAme!,
        price: price ?? product.price.toString(),
        description: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
    isLoading = false;
  }
}
