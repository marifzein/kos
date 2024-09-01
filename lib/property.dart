import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/painting.dart';
//import 'package:flutter/rendering.dart';
//import 'package:flutter/widgets.dart';
import 'package:kos/dashboard.dart';
import 'package:kos/usraccount.dart';
import 'package:kos/tagihan.dart';
import 'package:kos/libclass.dart';
import 'package:kos/main.dart';
import 'package:kos/entities/kos.dart';
import 'package:kos/objectbox.g.dart';

class properti extends StatefulWidget {
  //const properti({super.key});

  final String idProperti;

  properti({Key? key, required this.idProperti}) : super(key: key);

  @override
  State<properti> createState() => _propertiState();
}

class _propertiState extends State<properti> {
  final TextEditingController _namaprop =
      TextEditingController(text: 'Griya Sahabat');
  final TextEditingController _alamat =
      TextEditingController(text: 'Jalan Pahlawan 1');
  final TextEditingController _pemilik = TextEditingController(text: 'Fulan');
  final TextEditingController _telp =
      TextEditingController(text: '088811112222');
  final TextEditingController _email =
      TextEditingController(text: 'anda@gmail.com');
  int currentIndex = 0;
  @override
  final _propinsi = ["Jatim", "Jateng", "DKI"];
  final _kota = [
    "Surabaya",
    "Semarang",
    "Jakarta",
    "Malang",
    "Pekalongan",
    "Bandung"
  ];
  final Box<Properti> propertiBox = store.box<Properti>();
  final Box<Propinsi> propinsiBox = store.box<Propinsi>();
  final Box<Kota> kotaBox = store.box<Kota>();
  int propinsiku = 0;
  int kotaku = 1;
  final List<Map<String, String>> kotaTemp = [];
  //int currentIndex = 0;
//=====================================================
  Future _tampilkota(int val) async {
    return setState(() {
      //val = int.parse(val);
      log('macet 1');

      //log('val = $val sedangkan propinsiku = $propinsiku');
      if (propinsiku != val) {
        //kotaSelected = 1;
        log('macet 2');
        //log('Query kalo beda propinsi');
        kotaTemp.clear();
        //var kotaTemp = [];
        QueryBuilder<Kota> builder =
            kotaBox.query(Kota_.idPropinsi.equals(val));
        //kotaBox.query(Kota_.idPropinsi.equals(val));
        Query<Kota> query = builder.build();

        var blung = query.find();
        //List blung = query.find();

        log('macet 3 inilah isine kotaTemp seblm blung masuk ke kotatemp');

        //==========================iterate
        //blung.forEach((e) {};
        for (int i = 0; i < blung.length; i++) {
          kotaTemp.add({'id': (blung[i].id).toString(), 'nama': blung[i].nama});
        }

        //log('blung ke 0=${blung[0].id}');
        kotaku = blung[0].id;
      }

      propinsiku = val;

      log('macet 4 selectedkota =$kotaku selectedProp=$propinsiku');
    });
  }

  @override
  Widget build(BuildContext context) {
    //return MaterialApp(
    //debugShowCheckedModeBanner: false,
    //home: Scaffold(
    return Scaffold(
      //appBar: AppBar(title: Text("Peroperti")),
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        title: Text(
          "Property.dart " + MyGlobalVariables.userName,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        //backgroundColor: Color.fromARGB(255, 195, 0, 110),
        //foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                //colors: [Color(0xff0096ff), Color(0xff6610f2)],
                //colors: [Color.fromARGB(255, 195, 0, 110), Color(0xff6610f2)],
                colors: [Color(0xffc94b4b), Color(0xffc94b4b)],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight),
            //image: DecorationImage(
            //  image: AssetImage('assets/img/dot-pattern.png'),
            //repeat: ImageRepeat.repeat),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //NAMA PROPERTI
              Text(
                'Nama Properti',
                style: const TextStyle(
                  color: Color.fromARGB(255, 195, 0, 110),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                widget.idProperti,
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              /* TextField(
                //style: TextStyle(fontSize: 12),

                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: widget.idProperti,
                  prefixIcon: Icon(Icons.house_sharp),
                ),
              ), */
              const SizedBox(height: 10),
              //ALAMAT
              Text(
                'Alamat Properti',
                style: const TextStyle(
                  color: Color.fromARGB(255, 195, 0, 110),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),

              TextField(
                style: TextStyle(fontSize: 12),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: "Jl. Pahlawan no 1, Jakarta",
                  prefixIcon: Icon(Icons.location_on_outlined),
                ),
              ),
              const SizedBox(height: 10),
              //Propinsi
              Text(
                'Propinsi',
                style: const TextStyle(
                  color: Color.fromARGB(255, 195, 0, 110),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              DropdownButtonFormField(
                  hint: Text('Propinsi'),
                  value: (propinsiBox.isEmpty()
                      ? 0
                      : propinsiBox.getAll().first.id),
                  isDense: true,
                  dropdownColor: Color.fromARGB(255, 245, 245, 245),
                  icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                  isExpanded: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(CupertinoIcons.location_solid),
                    //border: OutlineInputBorder(
                    // borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  //borderRadius: BorderRadius.all(Radius.circular(10.0)),

                  //items: _propinsilist
                  items: propinsiBox
                      ?.getAll()
                      .map((e) => DropdownMenuItem(
                            value: e.id,
                            child: Text(e.nama),
                          ))
                      .toList(),
                  onChanged: (val) {
                    _tampilkota(val!);
                  }),
              const SizedBox(height: 10),
              //Kota
              Text(
                'Kota',
                style: const TextStyle(
                  color: Color.fromARGB(255, 195, 0, 110),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              DropdownButtonFormField(
                  hint: Text('Kota'),
                  value: (kotaTemp.isEmpty ? 0 : kotaTemp[0]["id"]),
                  dropdownColor: Color.fromARGB(255, 245, 245, 245),
                  icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                  isExpanded: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(CupertinoIcons.location),
                  ),
                  items: kotaTemp
                      .map((e) => DropdownMenuItem(
                            value: e['id'],
                            child: Text(e['nama'].toString()),
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      kotaku = int.parse(newValue.toString());
                      log(kotaku.toString());
                    });
                  }),
              const SizedBox(height: 40),
              //button simpan
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    fixedSize: Size(200, 50),
                    backgroundColor: Color(0xff3b7b7a),
                    foregroundColor: Colors.white,
                    splashFactory: InkSplash.splashFactory,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'S I M P A N',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              /*Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      fixedSize: Size(300, 60),
                      backgroundColor: Color.fromARGB(255, 195, 0, 110),
                      foregroundColor: Colors.white,
                      splashFactory: InkSplash.splashFactory,
                    ),
                    onPressed: () {},
                    child: const Text('S I M P A N'),
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white60,
        selectedItemColor: Colors.white,
        backgroundColor: Color(0xff414643),
        //backgroundColor: Colors.deepPurple[400],
        iconSize: 35,
        //onTap: (index) => setState(() => currentIndex = index),
        onTap: (index) => setState(
          () => chPage(index),
        ),
        //setState(()=>Navigator.pushNamed(context, Dashboard(jeneng: 'asd'))),

        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.amber,
              icon: Icon(Icons.home),
              label: 'Dashboard'),
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.notifications),
              label: 'Notifikasi'),
          BottomNavigationBarItem(
              backgroundColor: Colors.green,
              icon: Icon(Icons.person_sharp),
              label: 'Profil'),
        ],
      ),
    );
  }

  chPage(index) {
    final halTujuan = [
      Dashboard(),
      tagihan(),
      usraccount(),
    ];
    setState(() => currentIndex = index);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        //return Dashboard(jeneng: widget.jenengprop);
        return halTujuan[index];
      }),
    );
    //Navigator.pushNamed(context, Dashboard(jeneng: 'asd'));
    //debugPrint('asd');
    //debugPrint('chPage function');
  }
}
