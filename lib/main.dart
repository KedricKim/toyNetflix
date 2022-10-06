// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:rojje/screen/home_screen.dart';
import 'package:rojje/screen/more_screen.dart';
import 'package:rojje/widget/bottom_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // TabController controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MongFlix',
      theme: ThemeData(
        accentColor: Colors.white,
        brightness: Brightness.dark,
        primaryColor: Colors.black,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              Container(
                  child: Center(
                child: Text('search'),
              )),
              Container(
                  child: Center(
                child: Text('save'),
              )),
              MoreScreen()
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
