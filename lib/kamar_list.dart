import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:go_router/go_router.dart';
import 'package:kos/dashboard.dart';
import 'package:kos/kamar_edit.dart';
import 'package:kos/kamar_add.dart';
import 'package:kos/libclass.dart';

void main() {
  //runApp(propertiList());
}

class DaftarKamar extends StatefulWidget {
  //final String ownerKos;
  final String idProperti;
  //final int idUser;

  const DaftarKamar({
    super.key,
    required this.idProperti,
  });
  /*  DaftarKamar({Key? key, required this.ownerKos, required this.idProperti,required this.idUser})
      : super(key: key); */
  //const propertiList({super.key});

  @override
  State<DaftarKamar> createState() => _DaftarKamarState();
}

class _DaftarKamarState extends State<DaftarKamar> {
  @override
  List daftarKamar = [
    {"id": 1, "typeKamar": "AC KM dalam", "tarif": "1500000"},
    {"id": 2, "typeKamar": "Fan KM dalam", "tarif": "750000"},
    {"id": 3, "typeKamar": "Fan", "tarif": "550000"},
    {"id": 3, "typeKamar": "AC KM Dalam arkir Mobil", "tarif": "1750000"}
  ];

  //var context;

  Widget build(BuildContext context) {
    //final Size size = MediaQuery.of(context).size;
    int _currentIndex = 0;
    //return MaterialApp(
    //debugShowCheckedModeBanner: false,
    //home: Scaffold(
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffc94b4b),
        leading: BackButton(color: Colors.white),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        title: Text(
          "Kamar " + MyGlobalVariables.userName + " kamar_list.dart",
          style: TextStyle(
              //fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      body: /* Column(
        children: [ */
          Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Container(
                color: Colors.black12,
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    for (var i = 0; i < daftarKamar.length; i++)
                      listBuild(daftarKamar[i]['typeKamar'].toString(),
                          daftarKamar[i]['tarif'].toString()),

                    /* ListView.builder(
                            shrinkWrap: true,
                            itemCount: daftarProperti.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(daftarProperti[index]['nama'].toString()),
                                subtitle:
                                    Text(daftarProperti[index]['alamat'].toString()),
                              );
                            }), */

                    //tambah property
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white60,
        selectedItemColor: Colors.white,
        backgroundColor: Color(0xff9bb6a1),
        iconSize: 35,
        onTap: (int newIndex) {
          setState(() {
            //chPage(index);
            _currentIndex = newIndex;
          });
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
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new FloatingActionButton(
          elevation: 10,
          child: Icon(Icons.add),
          onPressed: () {
//POPUP
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return KamarAdd();
                });
            //END OF POPUP
          }),
    );
  }

  listBuild(String namaKost, String alamat) {
    final splitted = namaKost.split(' ');
    //int pjgInisial = 0;
    //(splitted.length < 2 ? pjgInisial = 2 : pjgInisial = 2);
    String inisial = '';
    for (int i = 0; i < splitted.length; i++) {
      /* splitted.length < 2
          ? inisial = inisial + splitted[i].substring(0, 1)
          : inisial + 'blung'; */
      if (i < 2) {
        inisial = inisial + splitted[i].substring(0, 1);
      }
    }
    return Container(
      child: GestureDetector(
        onTap: () {
          //POPUP
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return KamarEdit(
                  namaKos: namaKost,
                );
              });
          //END OF POPUP
        },
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1, // 10%
              //child: Icon(Icons.home),
              child: new CircleAvatar(
                child: Text(
                  inisial,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                backgroundColor: Color(0xffeae3c3),
              ),
            ),
            Expanded(
              flex: 4, // 60%
              child: ListTile(
                title: Text(
                  namaKost,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(alamat),
              ),
            ),
            Expanded(
              flex: 4, // 15%
              child: Container(
                //color: Colors.amberAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              backgroundColor: Color(0xff3b7b7a)),
                          onPressed: () {
                            //POPUP
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return KamarEdit(namaKos: namaKost);
                                });
                            //END OF POPUP
                          },
                          child: Icon(
                            Icons.edit_note,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        Text('Edit'),
                      ],
                    ),
                    //),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      height: 80,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular((20))),
        color: Colors.white,
      ),
    );
  }
}
