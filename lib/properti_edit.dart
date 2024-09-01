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

class PropertiEdit extends StatefulWidget {
  //const properti({super.key});

  final String propertiId;
  final String namaKost;
  final String alamat;
  final String idkota;
  final String idPropinsi;

  const PropertiEdit(
      {super.key,
      required this.propertiId,
      required this.namaKost,
      required this.alamat,
      required this.idkota,
      required this.idPropinsi});

  /*  const PropertiEdit(
    String propertiId, {
    Key? key,
    required this.propertiId,
    required this.namaKost,
    required this.alamat,
    required this.idkota,
    required this.idPropinsi,
  }) : super(key: key);
 */
  @override
  State<PropertiEdit> createState() => _PropertiEditState();
}

class _PropertiEditState extends State<PropertiEdit> {
  final TextEditingController _namaproperti = TextEditingController(text: '');
  final TextEditingController _alamat = TextEditingController(text: '');
  final _formkey = GlobalKey<FormState>();
  int currentIndex = 0;
  @override
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
      //int val = int.parse(vol);
      //log('macet 1');
      //log(MyGlobalVariables.kota.toString());

      //log('val = $val sedangkan propinsiku = $propinsiku');
      if (propinsiku != val) {
        //kotaSelected = 1;
        kotaTemp.clear();
        QueryBuilder<Kota> builder =
            kotaBox.query(Kota_.idPropinsi.equals(val));
        Query<Kota> query = builder.build();

        var blung = query.find();
        //List blung = query.find();

        //==========================iterate
        //blung.forEach((e) {};
        for (int i = 0; i < blung.length; i++) {
          kotaTemp.add({'id': (blung[i].id).toString(), 'nama': blung[i].nama});
        }
        kotaku = blung[0].id;
        // log('isinya kotatemp');
        for (var e in kotaTemp) {
          /* log(e['id'].toString());
          log(e['nama'].toString()); */
        }
      }

      propinsiku = val;

      //log('macet 4 selectedkota =$kotaku selectedProp=$propinsiku');
    });
  }

  //final _formkeyUsr = GlobalKey<FormState>();
  @override
  initState() {
    _namaproperti.text = widget.namaKost;
    _alamat.text = widget.alamat;
    //log('widget alamat ${widget.alamat}');
    if (propinsiBox.isEmpty() == false) {
      //String propertiId;
      //String namaKost;
      //String alamat;
      //String idkota;
      //String idPropinsi;

      //int valui = propinsiBox.getAll().first.id;
      //log("initState Called nilai prop ID taks setting $valui");
      //_tampilkota(valui);
      _tampilkota(int.tryParse(widget.idPropinsi) ?? 0);
      propinsiku = int.tryParse(widget.idPropinsi) ?? 0;
      kotaku = int.tryParse(widget.idkota) ?? 0;
    } else {
      log('data table/entiti kosong');
    }
  }

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
          child: Form(
            key: _formkey,
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
                /*  Text(
                  widget.namaKost,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ), */
                TextFormField(
                  //style: TextStyle(fontSize: 12),
                  controller: _namaproperti,
                  validator: (nampro) => nampro!.length < 8
                      ? 'Nama properti Alamat minimal 8 karakter/angka/simbol'
                      : null,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    //hintStyle: TextStyle(fontSize: 15),
                    //hintText: widget.namaKost,
                    prefixIcon: Icon(Icons.house_sharp),
                  ),
                ),
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

                TextFormField(
                  controller: _alamat,
                  validator: (almt) => almt!.length < 10
                      ? 'Alamat minimal 10 karakter/angka/simbol'
                      : null,
                  style: TextStyle(fontSize: 12),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    /*  hintStyle: TextStyle(fontSize: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    hintText: widget.alamat, */
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
                    /* value: (propinsiBox.isEmpty()
                          ? 0
                          : propinsiBox.getAll().first.id), */
                    value: propinsiku,
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
                  //style: const TextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  //color: Color.fromARGB(255, 195, 0, 110),
                ),

                const SizedBox(height: 5),
                DropdownButtonFormField(

                    //color: Color.fromARGB(255, 195, 0, 110),
                    //style: TextStyle(fontSize: 15),

                    hint: Text('Kota'),
                    value: (kotaTemp.isEmpty
                        ? kotaTemp[0]["id"]
                        : kotaku.toString()),
                    //value: (kotaTemp.isEmpty ? 0 : kotaTemp[0]["id"]),
                    //value: MyGlobalVariables.kota,
                    //value: kotaku,
                    //value: kotaku.toString(),
                    /* value: (kotaTemp.isEmpty
                          ? MyGlobalVariables.kota
                          : kotaTemp[0]["id"]), */
                    dropdownColor: Color.fromARGB(255, 245, 245, 245),
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    isExpanded: true,
                    decoration: const InputDecoration(
                      //filled: true,
                      //fillColor: Colors.black87,
                      prefixIcon: Icon(CupertinoIcons.location),
                      //border: OutlineInputBorder(
                      //borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    //borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    /*  items: kotaBox
                            .getAll() */
                    //items: _kotalist
                    items: kotaTemp
                        .map((e) => DropdownMenuItem(
                              value: e['id'],
                              child: Text(e['nama'].toString()),
                            ))
                        .toList(),
                    //.map(e).toList(),
                    /* items: kotaTemp.map((e) => DropdownMenuItem(
                                  value: 1,
                                  child: Text(e['id'].toString()),
                                ))
                            .toList(), */
                    onChanged: (newValue) {
                      setState(() {
                        //kotaSelected = int.parse(newValue!);
                        //kotaSelected = newValue;
                        kotaku = int.parse(newValue.toString());
                        //log(newValue.toString());
                        //log(kotaku.toString());
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
                    onPressed: () {
                      log('formkey ' + _formkey.currentState.toString());
                      if (_formkey.currentState!.validate()) {
                        log('proses ngesave');
                        propertiBox.put(Properti(
                          id: int.parse(widget.propertiId),
                          pemilikId: MyGlobalVariables.userId,
                          nama: _namaproperti.text,
                          alamat: _alamat.text,
                          kota: kotaku,
                          propinsi: propinsiku,
                        ));

                        popsaveLocalan();
                        Navigator.of(context).pop();
                      } else {}
                    },
                    child: const Text(
                      'S I M P A N',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
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

//==============================================
  popsaveLocalan() {
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(milliseconds: 1100), () {
            /*   Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                return pgtujuan;
              }),
            ); */
            Navigator.of(context).pop();
          });

          //===showalert
          return AlertDialog(
            alignment: Alignment.center,
            title: Center(
              child: Text(
                'Simpan Data',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            content: SizedBox(
              height: 40,
              child: Center(
                child: Text(
                  'Data telah tersimpan!',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          );
          //end alert
        });
  }

  //==============================================
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
