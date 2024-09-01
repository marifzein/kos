//import 'dart:js_interop';

import 'package:flutter/material.dart';
//import 'package:kos/libclass.dart';
import 'package:kos/objectbox.g.dart';
import 'package:kos/entities/objectbox.dart';
import 'dart:developer';

void main() {
  runApp(myNewApp());
}

class myNewApp extends StatelessWidget {
  //const

  myNewApp({super.key});
  final int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    //return MaterialApp(
    //debugShowCheckedModeBanner: false,
    return Scaffold(
      /* appBar: AppBar(
        centerTitle: true,
        title: Text('new.dart'),
        foregroundColor: Colors.white,
        backgroundColor: Color(0xffc94b4b),
      ), */
      appBar: ApBar(),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Container(
                color: Colors.black12,
                child:
                    /* Column(
                  children: [
                    Text("Import data"),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('import')),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('retrieve')),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('Delete')),
                  ],
                ), */

                    //height: 400,

                    Column(
                  children: [
                    for (var i = 0; i < 35; i++)
                      Container(
                          height: 80,
                          width: double.infinity,
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular((20))),
                            color: Colors.white,
                          ),
                          child: Text('data ke $i')),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white60,
        selectedItemColor: Colors.white,
        backgroundColor: Color(0xff9bb6a1),
        iconSize: 35,
        onTap: (index) => {
          /* setState(() {
            chPage(index);
          }) */
        },
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.amber,
              icon: SizedBox(
                  width: 10, height: 10, child: Icon(Icons.home, size: 25)),
              label: ''),
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: SizedBox(
                  width: 10,
                  height: 10,
                  child: Icon(
                    Icons.notifications,
                    size: 25,
                  )),
              label: ''),
          /* BottomNavigationBarItem(
                backgroundColor: Colors.green,
                icon: Icon(Icons.person_sharp),
                label: 'Profil'), */
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new FloatingActionButton(
          elevation: 10, child: Icon(Icons.add), onPressed: () {}),
      //),
    );
    //);
  }
}

class ApBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text('new.dart pake class'),
      foregroundColor: Colors.white,
      backgroundColor: Color(0xffc94b4b),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}
