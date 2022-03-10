// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: "Esp32 light app"),
      );
  }


}

class HomePage extends StatefulWidget {
  const HomePage({Key? key,  required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool lightIsOn = false;
  String lightText = "Uit";

  bool toggle(bool value) {
    return !value;
  }

  String lightStatus(bool value) {
    setState(() {
      if(value) {
        lightText = "Aan";
      }else {
        lightText = "Uit";
      }
    });
    return lightText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Druk op dn knop voor een licht show'
            ),
            Text(
                lightText
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
        {
          lightIsOn = toggle(lightIsOn),
          lightStatus(lightIsOn)
        },
        child: const Icon(
          Icons.wb_incandescent,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
  
}


