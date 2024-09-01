import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:go_router/go_router.dart';
import 'package:kos/dashboard.dart';
import 'package:kos/penghuni_edit.dart';
import 'package:kos/penghuni_add.dart';
import 'package:kos/tagihan.dart';
import 'package:kos/libclass.dart';

void main() {
  //runApp(propertiList());
}

class DaftarPenghuni extends StatefulWidget {
  final String idProperti;

  DaftarPenghuni({Key? key, required this.idProperti}) : super(key: key);
  //const propertiList({super.key});

  @override
  State<DaftarPenghuni> createState() => _DaftarPenghuniState();
}

class _DaftarPenghuniState extends State<DaftarPenghuni> {
  @override
  List daftarAnakKos = [
    {"id": 1, "nama": "Roby", "typeKamar": "AC KM dalam", "tarif": "1500000"},
    {
      "id": 2,
      "nama": "Michael",
      "typeKamar": "AC KM dalam Mobil",
      "tarif": "2000000"
    },
    {"id": 1, "nama": "Rudi", "typeKamar": "Fan KM dalam", "tarif": "750000"},
    {"id": 1, "nama": "Edi", "typeKamar": "Fan", "tarif": "500000"},
  ];

  //var context;
  int currentIndex = 0;

  Widget build(BuildContext context) {
    //final Size size = MediaQuery.of(context).size;
    int _currentIndex = 0;

    //return MaterialApp(
    //debugShowCheckedModeBanner: false,
    //home: Scaffold(

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Daftar Penghuni Kost",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Pilih untuk edit, klik tombol + untuk tambah penghuni',
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
        shadowColor: Colors.black,
        elevation: 10,
        centerTitle: true,
        backgroundColor: Color(0xffc94b4b),
        foregroundColor: Colors.white,
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
                    for (var i = 0; i < daftarAnakKos.length; i++)
                      listBuild(
                          daftarAnakKos[i]['nama'].toString(),
                          daftarAnakKos[i]['typeKamar'].toString() +
                              ' Tarif:' +
                              daftarAnakKos[i]['tarif'].toString()),

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
      //disinilah navbar
      bottomNavigationBar: BotNaviBar(
        parcurrentIndex: 1,
      ),
      //end of navbar
      // bottomNavigationBar: BotNaviBar(ownerKos: widget.ownerKos),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new FloatingActionButton(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Icon(Icons.add),
          onPressed: () {
//POPUP
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return PenghuniAdd(
                    idProperti: 1,
                  );
                });
            //END OF POPUP
          }),
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
    return Container(
      child: GestureDetector(
        onTap: () {
          //POPUP
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return PenghuniEdit(namaKos: nama);
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
              flex: 6, // 60%
              child: ListTile(
                title: Text(
                  nama,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(desc),
              ),
            ),
            Expanded(
              flex: 3, // 15%
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
                                  return PenghuniEdit(namaKos: nama);
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

  chPage1(index) {
    final halTujuan = [Dashboard(), tagihan()];
    setState(() => currentIndex = index);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return halTujuan[index];
      }),
    );
  }
}

class BotNavBar3 extends StatelessWidget {
  const BotNavBar3({super.key});

  @override
  Widget build(BuildContext context) {
    //return bottomNavigationBar:
    return BottomNavigationBar(
      //currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.white60,
      selectedItemColor: Colors.white,
      backgroundColor: Color(0xff9bb6a1),
      iconSize: 35,
      /* onTap: (index) => setState(
          () => LibClass.chPage(context, index, widget.ownerKos),
        ), */
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
    );
  }
}
