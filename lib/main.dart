import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() {
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
          .doc('quick')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var doc = snapshot.data;
          if (doc.exists) {
            return Text(doc['content']);
          }
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
