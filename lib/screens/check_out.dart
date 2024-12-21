import 'package:flutter/material.dart';
import 'package:plant/constants.dart';
import 'package:plant/provider/cart.dart';
import 'package:plant/widgets/appbar.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Appbars()],
        backgroundColor: green,
        title: Text(
          "Check Out",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<Cart>(
        builder: (context, Carttt, child) {
          return Column(
            children: [
              SizedBox(
                height: 550,
                child: ListView.builder(
                  itemCount: Carttt.selectProducts.length,
                  itemBuilder: (context, index) {
                    final product = Carttt.selectProducts[index];
                    return Card(
                      child: ListTile(
                        title: Text(product.name), // اسم المنتج
                        subtitle: Text(
                          "\$${product.price.toStringAsFixed(2)}, ${product.location}", // السعر والموقع
                          style: TextStyle(color: Colors.grey),
                        ),
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(product.imgpath), // صورة المنتج
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            Carttt.remove(product);
                          },
                          icon: Icon(Icons.minimize),
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Pay \$${Carttt.price.toStringAsFixed(2)}",
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(green),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
