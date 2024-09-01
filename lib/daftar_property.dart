import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kos/properti_edit.dart';
import 'package:kos/properti_add.dart';
//import 'package:kos/tagihan.dart';
import 'package:kos/entities/kos.dart';
import 'package:kos/objectbox.g.dart';
import 'package:kos/libclass.dart';
import 'package:kos/main.dart';

void main() {
  //runApp(propertiList());
}

class PropertiList extends StatefulWidget {
  const PropertiList({Key? key}) : super(key: key);
  //const propertiList({super.key});

  @override
  State<PropertiList> createState() => _PropertiListState();
}

class _PropertiListState extends State<PropertiList> {
  @override
  final Box<Properti> propertiBox = store.box<Properti>();
  final Box<Kota> kotaBox = store.box<Kota>();
  final List<Map<String, String>> propertiTemp = [];

  initState() {
    QueryBuilder<Properti> builder =
        propertiBox.query(Properti_.pemilikId.equals(MyGlobalVariables.userId));
    //kotaBox.query(Kota_.idPropinsi.equals(val));
    Query<Properti> query = builder.build();

    var hsl = query.find();
    // log(hsl.length.toString());
    //log(' global id' + MyGlobalVariables.userId.toString());
    //log('kasdkajhdkas');

    if (hsl.length > 0) {
      for (int i = 0; i < hsl.length; i++) {
        propertiTemp.add({
          'id': (hsl[i].id).toString(),
          'nama': hsl[i].nama,
          'alamat': hsl[i].alamat,
          'kota': srchKota(hsl[i].kota),
          'idKota': '${hsl[i].kota}',
          'idPropinsi': '${hsl[i].propinsi}',
        });
        log('${hsl[i].nama} - ${hsl[i].alamat}');

        // log(hsl.length.toString());
        //kotaTemp.add({e.id, e.nama});

        // kotaTemp.add({e.id,e.nama});
      }
    } else {
      propertiTemp.add({
        'id': '0',
        'nama': "Data properti masih kosong",
        'alamat': "Tombol + (plus) untuk tambah data",
        'kota': '',
        'idKota': '',
        'idPropinsi': ''
      });
      /*  propertiTemp.add({
        "id": "0",
        "nama": "Data properti kosong",
        "alamat": "Silahkan tambah data ( tap tombol +)",
        "kota": "0"
      }); */
      /* final List<Map<String, String>> propertiTemp = [
        {
          "id": "0",
          "nama": "Data properti kosong",
          "alamat": "Silahkan tambah data ( tap tombol +)",
          "kota": "0"
        }
      ]; */
    }
    //log(propertiTemp[0]['nama'].toString());
    //log(propertiTemp.length.toString());
  }

  //var context;
  srchKota(idKota) {
    var yamin = kotaBox.getAll();
    for (int i = 0; i < yamin.length; i++) {
      if (idKota == yamin[i].id) {
        return (yamin[i].nama);
        // log('kota : ${yamin[i].nama}');
      }
    }
  }

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
          "Properti " + MyGlobalVariables.userName,
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
                child:
                    //loopBuild()
                    Column(
                  children: [
                    //loopBuild(),

                    if (propertiTemp.length > 0)
                      for (var i = 0; i < propertiTemp.length; i++)
                        //{
                        listBuild(
                          propertiTemp[i]['id'].toString(),
                          propertiTemp[i]['nama'].toString(),
                          propertiTemp[i]['alamat'].toString() +
                              '-' +
                              propertiTemp[i]['kota'].toString(),
                          propertiTemp[i]['idKota'].toString(),
                          propertiTemp[i]['idPropinsi'].toString(),
                        ),
                    //},

                    /* for (var i = 0; i < daftarProperti.length; i++)
                      listBuild(daftarProperti[i]['nama'].toString(),
                          daftarProperti[i]['alamat'].toString()), */

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
      floatingActionButton: FloatingActionButton(
          elevation: 10,
          child: Icon(Icons.add),
          onPressed: () {
            /* Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return propertiadd();
              }),
            ); */
            //Navigator.pushNamed(context, propertiadd()).then((_) => setState(() {}));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => propertiadd()),
            ).then((value) => setState(() {}));

//POPUP
            /* showDialog(
                context: context,
                builder: (BuildContext context) {
                  return propertiadd();
                }); */
            //END OF POPUP
          }),
    );
  }

  Widget loopBuild() {
    log('panjang propertitemp ${propertiTemp.length}');
    int byk = propertiTemp.length;
    if (byk > 0) {
      List<Widget> yak = [];
      return Text("");
      /* List<Widget> katak = propertiTemp
          .map(
            (e) => Text(e['nama']!),
          )
          .toList(); */
      /*  for (int i = 0; i < 5; i++) {
        yak.add(Text('row $i'));
      } */
      //yak.add(katak);

/*           children: propertiTemp
              .map((e) => Container(child: Text(e['nama']!)))
              .toList());
 */

      //listBuild(e['id'],e['nama'], ))).toList());
      /* return Column(
        
          children: propertiTemp.map(
              (e) => listBuild(e['id'], e['namakost'], e['alamat']).toList())); */
    }
    //for (int i = 0; i < byk; i++) {}
    else {
      log('blm ada data');
      return listBuild("0", 'Anda belum input data properti milik anda',
          'klik tombol +', '', '');
    }
  }

  listBuild(String propertiId, String namaKost, String alamat, String idkota,
      String idPropinsi) {
    final splitted = namaKost.split(' ');

    //ini prefix avatar dgn inisial 2 huruf
    String inisial = '';

    for (int i = 0; i < 1; i++) {
      inisial = inisial + splitted[i].substring(0, 1);
    }
    return Container(
      height: 80,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular((20))),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1, // 10%
            //child: Icon(Icons.home),
            child: new CircleAvatar(
              backgroundColor: Color(0xffeae3c3),
              child: Text(
                inisial,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 7, // 60%
            child: ListTile(
              title: Text(
                namaKost,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(alamat),
            ),
          ),
          Expanded(
            flex: 2, // 15%
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PropertiEdit(
                                    propertiId: propertiId,
                                    namaKost: namaKost,
                                    alamat: alamat,
                                    idkota: idkota,
                                    idPropinsi: idPropinsi)),
                          ).then((value) => setState(() {}));
                          //POPUP
                          /*  showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return PropertiEdit(
                                    propertiId: propertiId,
                                    namaKost: namaKost,
                                    alamat: alamat,
                                    idkota: idkota,
                                    idPropinsi: idPropinsi);
                              }); */
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
    );
  }
}
