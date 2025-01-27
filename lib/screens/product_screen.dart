import 'package:addtocart/data/products_data.dart';
import 'package:addtocart/providers/cart_notifiers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    var obj = Provider.of<CartNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(
          Icons.electric_bolt_rounded,
          size: 50,
        ),
        title: Text("Electronic Store",
            style: GoogleFonts.akronim(
                textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ))),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => CartScreen()));
            },
            icon: const Icon(
              Icons.shopping_cart,
              size: 40,
            ),
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
            itemCount: products_list.length,
            itemBuilder: (context, index) {
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      products_list[index].p_img,
                      width: MediaQuery.sizeOf(context).width / 2 - 100,
                    ),
                    Expanded(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${products_list[index].p_name}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("${products_list[index].p_price}"),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              obj.addToCart(index);
                            },
                            icon: Icon(Icons.add_shopping_cart),
                            label: Text("Add To Cart"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
