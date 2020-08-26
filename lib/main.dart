import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new Notepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Notepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FluFire'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _createBody(),
      ),
    );
  }

  // _ at the beginning means the function is private
  Widget _createBody() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('notes')
          .doc('todo')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var doc = snapshot.data;
          if (doc.exists) {
            print(snapshot.data['content']);
          }
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
