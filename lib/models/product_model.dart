//ใช้เพื่อกำหนดเค้าโครงข้อมูลของสินค้า ซึ่งใช้เก็บข้อมูลที่ได้มาจากฐานข้อมูล และถูกนำมาใช้ในการแสดงผล
class ProductModel {
  String id; //เก็บรหัสสินค้า
  String croissant; //เก็บชื่อสินค้า
  int price; //ราคาสินค้า
  ProductModel({
    required this.id,
    required this.croissant,
    required this.price,
  });
  factory ProductModel.fromMap(Map<String, dynamic>? product) {
    // factory นำหน้า แสดงว่าภายในคอนสตรัคเตอร์ จะต้องรีเทิร์นค่ากลับมาเป็นออบเจ็กต์ของคลาส ProductModel
    //ใส่ ? เเทนการเขียนโคต if (product == null) {return null;}
    String id =
        product?['id']; //ข้อมูล id เก็บค่าที่ได้มาจากฟิลด์ id ของฐานข้อมูล
    String croissant = product?['croissant'];
    int price = product?['price'];
    return ProductModel(id: id, croissant: croissant, price: price);
  }
  Map<String, dynamic> toMap() {
    //สร้างเพื่อเเปลง พร็อพเพอณ์ตี้ภายในออบเจ็กต์ ให้เป็น Map<String, dynamic>ซึ่งเป็นประเภทข้อมูลที่เหมาะสำหรับ Cloud Firestore
    return {
      'id': id,
      'croissant': croissant,
      'price': price,
    };
  }
}
