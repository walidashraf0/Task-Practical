import 'package:flutter/material.dart';
import 'package:plant/provider/cart.dart';
import 'package:plant/screens/check_out.dart';
import 'package:provider/provider.dart';

class Appbars extends StatelessWidget {
  const Appbars({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, Carttt, child) {
      return Row(
        children: [
          Stack(
            children: [
              Positioned(
                bottom: 24,
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Text("${Carttt.selectProducts.length}",
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(211, 164, 255, 193),
                      shape: BoxShape.circle),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return CheckOut();
                      },
                    ));
                  },
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                  )),
            ],
          ),
          Text(
            "\$ ${Carttt.price}",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          SizedBox(
            width: 20,
          )
        ],
      );
    });
  }
}
