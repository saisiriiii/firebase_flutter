import 'package:firebase_flutter/models/product_model.dart';
import 'package:flutter/material.dart';

const KLeadingText = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w300,
  color: Colors.blue,
);
const kTrailingText = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w300,
  color: Colors.black,
);

class ProductItem extends StatelessWidget {
  final ProductModel product;
  ProductItem({required this.product});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ListTile(
        leading: Text(
          product.croissant,
          style: KLeadingText,
        ),
        title: Text(
          product.price.toStringAsFixed(2), //ทศนิยม2
          style: kTrailingText,
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
