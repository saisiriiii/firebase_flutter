import 'package:firebase_flutter/models/product_model.dart';
import 'package:firebase_flutter/service/database.dart';
import 'package:firebase_flutter/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductLists extends StatelessWidget {
  const ProductLists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Database db = Database.instance;
    Stream<List<ProductModel>> stream = db.getAllProductStream();
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: StreamBuilder<List<ProductModel>>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //เช็คว่ามีข้อมูลไหมใน firebase ไหม
            if (snapshot.data?.length == 0) {
              //มีสมาชิกข้างใน firebase ไหม
              return Center(
                child: Text('Sold Out Croissants'), //ไม่มี
              );
            }
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return ProductItem(
                  product: snapshot.data![index],
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
