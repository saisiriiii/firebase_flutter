import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_flutter/screan/productlists.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter With Firebase',
      home: MyHomePage3(),
    );
  }
}

class MyHomePage3 extends StatefulWidget {
  const MyHomePage3({Key? key}) : super(key: key);

  @override
  _MyHomePage3State createState() => _MyHomePage3State();
}

class _MyHomePage3State extends State<MyHomePage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Croissants'),
      ),
      body: Container(
        child: ProductLists(),
      ),
    );
  }
}
