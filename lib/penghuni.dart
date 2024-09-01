import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:go_router/go_router.dart';
import 'package:kos/dashboard.dart';
import 'package:kos/penghuni_list.dart';
import 'package:kos/tagihan.dart';
import 'package:kos/libclass.dart';

void main() {
  //runApp(propertiList());
}

class Penghuniclass extends StatefulWidget {
  Penghuniclass({Key? key}) : super(key: key);
  //const propertiList({super.key});

  @override
  State<Penghuniclass> createState() => _Penghuniclassstate();
}

class _Penghuniclassstate extends State<Penghuniclass> {
  @override
  List daftarProperti = [
    {
      "id": "1",
      "nama": "Griya Nyaman",
      "alamat": "Jl Mawar 1 Mawar 1 Mawar 1 Mawar 1"
    },
    {"id": "2", "nama": "Kost Indah", "alamat": "Jl Melati 2"},
    {"id": "3", "nama": "Kost Mabruk", "alamat": "Jl ِMelati 2"},
    {"id": "4", "nama": "Kost Barokah", "alamat": "Jl Lili 5"},
    {"id": "5", "nama": "Millenial", "alamat": "Jl Mawar 1"},
    {"id": "6", "nama": "Kost Indah", "alamat": "Jl Melati 2"},
    {"id": "7", "nama": "Kost Mabruk", "alamat": "Jl ِMelati 2"},
    {"id": "8", "nama": "Kost Barokah", "alamat": "Jl Lili 5"},
    {"id": "9", "nama": "Griya Nyaman", "alamat": "Jl Mawar 1"},
    {"id": "10", "nama": "Kost Indah", "alamat": "Jl Melati 2"},
    {"id": "11", "nama": "Kost Mabruk", "alamat": "Jl ِMelati 2"},
    {"id": "12", "nama": "Kost Barokah", "alamat": "Jl Lili 5"},
    {"id": "13", "nama": "Griya Nyaman", "alamat": "Jl Mawar 1"},
    {"id": "14", "nama": "Kost Indah", "alamat": "Jl Melati 2"},
    {"id": "15", "nama": "Kost Mabruk", "alamat": "Jl ِMelati 2"},
    {"id": "16", "nama": "Kost Barokah", "alamat": "Jl Lili 5"}
  ];
  int currentIndex = 0;

  //var context;

  Widget build(BuildContext context) {
    //final Size size = MediaQuery.of(context).size;
    int _currentIndex = 0;
    //return MaterialApp(
    //debugShowCheckedModeBanner: false,
    return Scaffold(
      //return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Daftar Properti/Kost",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Pilih property/kost',
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
        shadowColor: Colors.black,
        elevation: 10,
        centerTitle: true,
        backgroundColor: Color(0xffc94b4b),
        foregroundColor: Colors.white,
        /* backgroundColor: Color(0xffc94b4b),
        leading: BackButton(color: Colors.white),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        title: Text(
          "Penghuni - penghuni.dart",
          style: TextStyle(
              //fontWeight: FontWeight.bold,
              color: Colors.white),
        ), */
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
                    for (var i = 0; i < daftarProperti.length; i++)
                      listBuild(daftarProperti[i]['nama'].toString(),
                          daftarProperti[i]['alamat'].toString()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BotNaviBar(
        parcurrentIndex: 0,
      ),
    );
  }

  listBuild(String nama, String desc) {
    final splitted = nama.split(' ');

    String inisial = '';
    for (int i = 0; i < splitted.length; i++) {
      if (i < 2) {
        inisial = inisial + splitted[i].substring(0, 1);
      }
    }
    return GestureDetector(
      onTap: () {
        //POPUP
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return DaftarPenghuni(idProperti: "1");
            });
        //END OF POPUP
      },
      child: Container(
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
                  nama,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(desc),
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
                                  return DaftarPenghuni(
                                      idProperti: "1");
                                });
                            //END OF POPUP
                          },
                          child: Icon(
                            Icons.remove_red_eye,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        Text('Daftar Penghuni'),
                      ],
                    ),
                    //),
                  ],
                ),
              ),
            ),
          ],
        ),
        //),
        height: 80,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular((20))),
          color: Colors.white,
        ),
      ),
    );
  }
}
