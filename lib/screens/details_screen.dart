import 'package:flutter/material.dart';
import 'package:plant/constants.dart';
import 'package:plant/models/item.dart';
import 'package:plant/widgets/appbar.dart';

class DetailsScreen extends StatefulWidget {
  final Item Product;

  DetailsScreen({required this.Product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isShowMore = true;

  final String fixedImage =
      "https://cdn.salla.sa/dWGWy/XZTmmaVMjye7Qg7UY4PRes8vRhVGvhNVqrI3FBTU.jpg";
  final double fixedPrice = 14.5;
  final String fixedLocation = "main branch";
  final String fixedDescription =
      "This is a fixed description for all items. A flower, also known as a bloom or blossom, is the reproductive structure found in flowering plants.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title: Text(
          "Details Screen",
          style: TextStyle(color: Colors.white),
        ),
        actions: [const Appbars()],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(fixedImage),
            SizedBox(height: 16),
            Text(
              fixedPrice.toString(), // السعر الثابت
              style: TextStyle(fontSize: 23),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 30,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 129, 129),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(child: Text("New")),
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 191, 0),
                      size: 26,
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 191, 0),
                      size: 26,
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 191, 0),
                      size: 26,
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 191, 0),
                      size: 26,
                    ),
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 191, 0),
                      size: 26,
                    ),
                  ],
                ),
                Spacer(flex: 6),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(
                        Icons.edit_location,
                        color: Color.fromARGB(163, 3, 65, 27),
                      ),
                    ),
                    Text(
                      fixedLocation, // الموقع الثابت
                      style: TextStyle(fontSize: 19),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: Text(
                "Details :",
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.start,
              ),
            ),
            Text(
              fixedDescription,
              style: TextStyle(fontSize: 18),
              maxLines: isShowMore ? 3 : null,
              overflow: TextOverflow.fade,
            ),
            if (!isShowMore)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Detailed Specifications: This product is crafted from high-quality materials, ensuring durability and longevity.Warranty Information: Comes with a one-year warranty covering manufacturing defects Warranty Information: Comes with a one-year warranty covering manufacturing defects",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            TextButton(
              onPressed: () {
                setState(() {
                  isShowMore = !isShowMore;
                });
              },
              child: Text(
                isShowMore ? "Show more" : "Show Less",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
