import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kos/kamar_list.dart';
import 'package:kos/libclass.dart';
import 'package:kos/objectbox.g.dart';

void main() {
  //runApp(propertiList());
}

class KamarList extends StatefulWidget {
  KamarList({Key? key}) : super(key: key);
  //const propertiList({super.key});

  @override
  State<KamarList> createState() => _KamarListState();
}

class _KamarListState extends State<KamarList> {
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
          "Kamar " + MyGlobalVariables.userName + " kamar.dart",
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
                    for (var i = 0; i < daftarProperti.length; i++)
                      listBuild(
                          daftarProperti[i]['nama'].toString(),
                          daftarProperti[i]['alamat'].toString(),
                          daftarProperti[i]['id'].toString()),
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
      /* floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new FloatingActionButton(
          elevation: 10,
          child: Icon(Icons.add),
          onPressed: () {
//POPUP
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return KamarAdd(ownerkamar: widget.ownerkamar);
                });
            //END OF POPUP
          }), */
    );
  }

  listBuild(String namaKost, String alamat, String idProp) {
    final splitted = namaKost.split(' ');

    String inisial = '';
    for (int i = 0; i < splitted.length; i++) {
      inisial = inisial + splitted[i].substring(0, 1);
    }
    return Container(
      child: GestureDetector(
        onTap: () {
          //POPUP
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return DaftarKamar(
                  idProperti: idProp,
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
                                  return DaftarKamar(
                                    idProperti: idProp,
                                  );
                                });
                            //END OF POPUP
                          },
                          child: Icon(
                            Icons.remove_red_eye_rounded,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        Text('View Kamar'),
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
