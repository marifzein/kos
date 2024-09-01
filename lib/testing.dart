import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kos/dashboard.dart';

void main() {
  runApp(testing());
}

class testing extends StatelessWidget {
  //const MyApp({super.key});

  @override
  List itemkos = [
    'kost a',
    'kost b',
    'kost c',
  ];
  final daftarProperti = [
    {"nama": "Griya Nyaman", "alamat": "Jl Mawar 1 Mawar 1 Mawar 1 Mawar 1"},
    {"nama": "Kost Indah", "alamat": "Jl Melati 2"},
    {"nama": "Kost Mabruk", "alamat": "Jl ِMelati 2"},
    {"nama": "Kost Barokah", "alamat": "Jl Lili 5"},
    {"nama": "Griya Nyaman", "alamat": "Jl Mawar 1"},
    {"nama": "Kost Indah", "alamat": "Jl Melati 2"},
    {"nama": "Kost Mabruk", "alamat": "Jl ِMelati 2"},
    {"nama": "Kost Barokah", "alamat": "Jl Lili 5"},
    {"nama": "Griya Nyaman", "alamat": "Jl Mawar 1"},
    {"nama": "Kost Indah", "alamat": "Jl Melati 2"},
    {"nama": "Kost Mabruk", "alamat": "Jl ِMelati 2"},
    {"nama": "Kost Barokah", "alamat": "Jl Lili 5"},
    {"nama": "Griya Nyaman", "alamat": "Jl Mawar 1"},
    {"nama": "Kost Indah", "alamat": "Jl Melati 2"},
    {"nama": "Kost Mabruk", "alamat": "Jl ِMelati 2"},
    {"nama": "Kost Barokah", "alamat": "Jl Lili 5"}
  ];

  //var context;

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.white),
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          centerTitle: true,
          title: Text(
            "Properti dan kamar testing.dart",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  //colors: [Color(0xff0096ff), Color(0xff6610f2)],
                  colors: [Colors.blue, Color(0xff6610f2)],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight),
            ),
          ),
        ),
        body:
            /*Container(
          color: Colors.green[100],
          child: Column(
            children: [
              Container(
                height: 100,
                color: Colors.blue,
              ),*/

            SingleChildScrollView(
          child: Container(
            color: Colors.black12,
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                for (var i = 0; i < daftarProperti.length; i++)
                  listBuild(daftarProperti[i]['nama'].toString(),
                      daftarProperti[i]['alamat'].toString()),

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
                Container(
                  child: ListTile(
                    //leading: Icon(Icons.home),
                    trailing: Icon(Icons.add),
                    title: Text("Tambah Properti"),
                    subtitle: Text("Tambah properti/kost baru anda"),
                  ),
                  margin: EdgeInsets.all(1),
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular((10))),
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        /*Container(
          height: size.height,
          child: Expanded(
            child: ListView.builder(
              itemCount: itemsData.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return itemsData[index];
              },
            ),
          ),
        ),*/
      ),
    );
    //),
    //);
  }

  listBuild(String namaKost, String alamat) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1, // 10%
            child: Icon(Icons.home),
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
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: Colors.green[500]),
                        onPressed: () {},
                        child: Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                      Text('Type Kamar'),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: Colors.blue[500]),
                        onPressed: () {
                          //POPUP

                          //END OF POPUP
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                      Text('Add'),
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
