import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_flutter/models/product_model.dart';

// ใช้เพื่อติดต่อและจัดการข้อมูลไปยังฐานข้อมูลไปยังฐานข้อมูล Cloud Firestore เช้นการติดตามข้อมูลสินค้า การเพิ่มข้อมูล
// การแก้ไขข้อมูล และการลบข้อมูลสินค้า
class Database {
  static Database instance = Database._();
  Database._();
  Stream<List<ProductModel>> getAllProductStream() {
    //เลือกใช้ stream เพื่อดูข้อมูลได้ แบบ real time
    print('getall');
    final reference = FirebaseFirestore.instance.collection('Croissants');
    final query = reference.orderBy('price',
        descending: false); //เป็นตัวที่เอาไว้เรียงลำดับจากน้อยไปมาก
    //เรียงเอกสารจากมากไปน้อย โดยใช้ ฟิลด์ id
    final snapshots = query.snapshots();
    //QuerySnapshot<Map<String, dynamic>> snapshot
    //QuerySnapshot<Object?> snapshot
    return snapshots.map((snapshot) {
      return snapshot.docs.map((doc) {
        return ProductModel.fromMap(doc.data());
      }).toList();
    });
  }
}
