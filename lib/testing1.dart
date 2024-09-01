import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:go_router/go_router.dart';
import 'package:kos/dashboard.dart';

void main() {
  runApp(testing1());
}

class testing1 extends StatelessWidget {
  final daftarKamar = [
    {"id": 1, "typeKamar": "AC KM dalam", "tarif": "1500000"},
    {"id": 2, "typeKamar": "Fan KM dalam", "tarif": "750000"},
    {"id": 3, "typeKamar": "Fan", "tarif": "550000"},
    {"id": 1, "typeKamar": "AC KM dalam", "tarif": "1500000"},
    {"id": 2, "typeKamar": "Fan KM dalam", "tarif": "750000"},
    {"id": 3, "typeKamar": "Fan", "tarif": "550000"},
    {"id": 1, "typeKamar": "AC KM dalam", "tarif": "1500000"},
    {"id": 2, "typeKamar": "Fan KM dalam", "tarif": "750000"},
    {"id": 3, "typeKamar": "Fan", "tarif": "550000"},
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 10,
            fixedSize: Size(300, 60),
            backgroundColor: Color(0xff3b7b7a),
            foregroundColor: Colors.white,
            splashFactory: InkSplash.splashFactory,
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Scaffold(
                    backgroundColor: Colors.white,
                    appBar: AppBar(
                      centerTitle: true,
                      title: Text(
                        "Type Kamar testing1.dart",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      flexibleSpace: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              //colors: [Color(0xff0096ff), Color(0xff6610f2)],
                              colors: [Color(0xffc94b4b), Color(0xffc94b4b)],
                              begin: FractionalOffset.topLeft,
                              end: FractionalOffset.bottomRight),
                        ),
                      ),
                    ),
                    body: Column(
                      children: [
                        Container(
                          child: SingleChildScrollView(
                            child: Container(
                              //color: Colors.black12,
                              color: Color(0xffeae3c3),
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  for (var i = 0; i < daftarKamar.length; i++)
                                    listBuild(
                                        daftarKamar[i]['typeKamar'].toString(),
                                        daftarKamar[i]['tarif'].toString()),

                                  /*  child: IconButton(
                                icon: Icon(Icons.ac_unit),
                                onPressed: () {
                                  Navigator.pop(context);
                                }), */

                                  //BUTTON BIASA

                                  /* Container(
                                    child: ListTile(
                                      //leading: Icon(Icons.home),
                                      trailing: Icon(Icons.add),
                                      title: Center(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            elevation: 5,
                                            fixedSize: Size(200, 40),
                                            backgroundColor: Color(0xff3b7b7a),
                                            foregroundColor: Colors.white,
                                            splashFactory: InkSplash.splashFactory,
                                          ),
                                          onPressed: () {},
                                          child: const Text(
                                            'TAMBAH TYPE KAMAR',
                                            style: TextStyle(
                                                //fontSize: 1,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      subtitle: Column(children: [
                                        Text(
                                            textAlign: TextAlign.center,
                                            "Tambah type kamar dengan fasilitas baru"),
                                        Text(
                                            textAlign: TextAlign.center,
                                            "(misal luas kamar, AC, kamar mandi dalam dsb)"),
                                      ]),
                                    ),
                                    margin: EdgeInsets.all(1),
                                    padding: EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular((30))),
                                      color: Colors.white,
                                    ),
                                  ) */
                                  //end button biasa
                                ],
                              ),
                            ),
                          ),
                        ),
                        //mencoba button stick bottom
                        Container(
                          child: Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 10,
                                  fixedSize: Size(300, 60),
                                  backgroundColor: Color(0xff3b7b7a),
                                  foregroundColor: Colors.white,
                                  splashFactory: InkSplash.splashFactory,
                                ),
                                onPressed: () {},
                                child: const Text('S I M P A N'),
                              ),
                            ),
                          ),
                        ),
                        //end mencoba,)
                      ],
                    ),
                  );
                });
          },
          child: const Text('BUKA DIALOG WINDOW'),
        ),
      ),
    );
  }

  listBuild(String typeKamar, String tarif) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1, // 10%
            child: Icon(Icons.bedroom_parent),
          ),
          Expanded(
            flex: 4, // 60%
            child: ListTile(
              title: Text(
                typeKamar,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(tarif),
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
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            /* backgroundColor: Colors.blue[500]), */
                            backgroundColor: Color(0xff9bb6a1)),
                        onPressed: () {
                          //POPUP

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
      margin: EdgeInsets.all(1),
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular((20))),
        color: Colors.white,
      ),
    );
  }
}
