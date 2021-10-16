# firebase_flutter

Flutter Firebase NoSQL : Croissants

## Developer

Sirikamon Puttarat 62020730

## System

- Croissants Application.
- Croissant is the best bread ever !
- Premium French Croissant !

### Order

[![245055743-1287928475051243-6094936959581137147-n.jpg](https://i.postimg.cc/Y9wxFyZ9/245055743-1287928475051243-6094936959581137147-n.jpg)](https://postimg.cc/R3Xf5GM5)

- หน้าจอหลัก ขายครัวซอง
- แสดงข้อมูลรายละเอียดของสินค้า
- แสดงชื่อเมนูของครัวซอง
- แสดงราคาของครัวซองแต่ละเมนู

### Sold Out

[![245055743-1287928475051243-6094936959581137147-n.jpg](https://i.postimg.cc/Y9wxFyZ9/245055743-1287928475051243-6094936959581137147-n.jpg)](https://postimg.cc/R3Xf5GM5)

- ครัวซองขายหมดแล้ว
- จะแสดง ' Sold Out Croissants '

### Cloud Firestore

[![245276115-251973263609961-4579927676462432523-n.png](https://i.postimg.cc/pTPbVkWN/245276115-251973263609961-4579927676462432523-n.png)](https://postimg.cc/yJprvm3n)

- เก็บ อัพเดท แก้ไข ลบ Data ใน Firebase
- เมนูครัวซองมี รหัส ชื่อ ราคา ของสินค้า

### Model

```dart
//ใช้เพื่อกำหนดเค้าโครงข้อมูลของสินค้า ซึ่งใช้เก็บข้อมูลที่ได้มาจากฐานข้อมูล และถูกนำมาใช้ในการแสดงผล
class ProductModel {
  String id; //เก็บรหัสสินค้า
  String croissant; //เก็บชื่อสินค้า คือ ชื่อเมนูครัวซองแต่ละประเภท
  int price; //ราคาสินค้า
  ProductModel({
    required this.id,
    required this.croissant,
    required this.price,
  });
  factory ProductModel.fromMap(Map<String, dynamic>? product) {
    // factory นำหน้า แสดงว่าภายใน constructor จะต้อง return ค่ากลับมา เป็น object ของ class ProductModel
    //ใส่ ? เเทนการเขียนโค้ด if (product == null) {return null;}
    String id = product?['id'];
    //ข้อมูล id เก็บค่าที่ได้มาจากฟิลด์ id ของฐานข้อมูล
    String croissant = product?['croissant'];
    //ข้อมูล croissant เก็บค่าที่ได้มาจากฟิลด์ croissant ของฐานข้อมูล
    int price = product?['price'];
    //ข้อมูล price เก็บค่าที่ได้มาจากฟิลด์ price ของฐานข้อมูล
    return ProductModel(id: id, croissant: croissant, price: price);
  }
  Map<String, dynamic> toMap() {
    //สร้างเพื่อเเปลง property ภายใน object ให้เป็น Map<String, dynamic> ซึ่งเป็นประเภทข้อมูลที่เหมาะสำหรับ Cloud Firestore
    return {
      'id': id,
      'croissant': croissant,
      'price': price,
    };
  }
}
```

### แก้ไขสินค้า

```dart
  Future<void> setProduct({ProductModel? product}) async {
      //เลือก collection ที่ต้องการตามด้วย document เเล้วเอามาเก็บใน reference
    final reference = FirebaseFirestore.instance.doc('products/${product?.id}');
    try {
      await reference.set(product!.toMap());
    } catch (err) {
      rethrow;
    }
  }
```


