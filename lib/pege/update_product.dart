import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stor/models/product_model.dart';
import 'package:stor/services/updatr_product.dart';
import 'package:stor/widget/CustomButon.dart';
import 'package:stor/widget/castmar_text_field.dart';

class UpdataProductPage extends StatefulWidget {
  UpdataProductPage({super.key});
  static String id = 'update product';

  @override
  State<UpdataProductPage> createState() => _UpdataProductPageState();
}

class _UpdataProductPageState extends State<UpdataProductPage> {
  bool isLoading = false;

  String? productName, desc, image, price;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading = false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  hintText: 'product Name',
                  onChanged: (data) {
                    productName = data;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: 'description',
                  onChanged: (data) {
                    desc = data;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  inputType: TextInputType.number,
                  hintText: 'price',
                  onChanged: (data) {
                    price = data;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: 'image',
                  onChanged: (data) {
                    image = data;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(hintText: 'product Name'),
                SizedBox(
                  height: 50,
                ),
                CustomButon(
                  text: 'Updata',
                  colors: Colors.blue,
                  onTap: () async {
                    isLoading = true;
                    setState(() {});

                      await updateProduct(product);
                    try {
                      print('ok');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }

}
