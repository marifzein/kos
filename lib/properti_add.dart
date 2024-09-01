import 'dart:developer';
import 'dart:ui';
import 'package:kos/daftar_property.dart';
import 'package:stack_trace/stack_trace.dart' as stacktrace;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/* import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart'; */
import 'package:kos/dashboard.dart';
import 'package:kos/usraccount.dart';
import 'package:kos/tagihan.dart';
import 'package:kos/entities/kos.dart';
import 'package:kos/objectbox.g.dart';
import 'package:kos/libclass.dart';
import 'package:kos/main.dart';

class propertiadd extends StatefulWidget {
  //const properti({super.key});
  //final String namaOwner;

  propertiadd({Key? key}) : super(key: key);

  @override
  State<propertiadd> createState() => _propertiaddState();
}

//==============================================================
class _propertiaddState extends State<propertiadd> {
  final TextEditingController _namaprop =
      TextEditingController(text: 'kadhka dkahsdk haksdhaksdhkahsdkj');
  final TextEditingController _alamat = TextEditingController(
      text: 'kashdkjasd kash dkahsdkajhsdkah dskahsdkash');
  final _formkey = GlobalKey<FormState>();
  //final TextEditingController _pemilik = TextEditingController(text: 'Fulan');
  //final TextEditingController _telp =
  //  TextEditingController(text: '088811112222');
  //final TextEditingController _email =
  //  TextEditingController(text: 'anda@gmail.com');

  final Box<Properti> propertiBox = store.box<Properti>();
  final Box<Propinsi> propinsiBox = store.box<Propinsi>();
  final Box<Kota> kotaBox = store.box<Kota>();
  int propinsiku = 0;
  int kotaku = 1;
  final List<Map<String, String>> kotaTemp = [];
  int currentIndex = 0;
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
  initState() {
    if (propinsiBox.isEmpty() == false) {
      int valui = propinsiBox.getAll().first.id;
      //log("initState Called nilai prop ID taks setting $valui");
      _tampilkota(valui);
      //kotaku = 8;
    } else {
      log('data table/entiti kosong');
    }
  }

  /* final _propinsi = ["Jatim", "Jateng", "DKI"];
  final _kota = [
    "Surabaya",
    "Semarang",
    "Jakarta",
    "Malang",
    "Pekalongan",
    "Bandung"
  ]; */

  Widget build(BuildContext context) {
    //return MaterialApp(
    //debugShowCheckedModeBanner: false,
    //home: Scaffold(
    return Scaffold(
      //appBar: AppBar(title: Text("Peroperti")),
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tambah Properti/Kost baru ${MyGlobalVariables.userName}",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
        shadowColor: Colors.black,
        elevation: 10,
        centerTitle: true,
        backgroundColor: Color(0xffc94b4b),
        foregroundColor: Colors.white,
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
                  'Nama Properti/Kost',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 195, 0, 110),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  //style: TextStyle(fontSize: 12),
                  controller: _namaprop,
                  validator: (alamat) => alamat!.length < 10
                      ? 'Nama properti minimal 5 boleh terdiri dari huruf , angka'
                      : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    hintText: '',
                    prefixIcon: Icon(Icons.house_sharp),
                  ),
                ),
                /*  const SizedBox(height: 10),
            
                const SizedBox(height: 10), */
                //ALAMAT

                const SizedBox(height: 10),
                Text(
                  'Alamat',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 195, 0, 110),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),

                TextFormField(
                  controller: _alamat,
                  validator: (alamat) => alamat!.length < 10
                      ? 'Alamat  minimal 10 boleh terdiri dari huruf , angka'
                      : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(fontSize: 12),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    hintText: "",
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
                    onPressed: () {
                      //log(_formkey.currentState!.validate().toString());
                      if (_formkey.currentState!.validate()) {
                        //data valid =>save
                        log('proses ngesave');
                        propertiBox.put(Properti(
                          //id: 0,
                          pemilikId: MyGlobalVariables.userId,
                          nama: _namaprop.text,
                          alamat: _alamat.text,
                          kota: kotaku,
                          propinsi: propinsiku,
                        ));

                        popsaveLocalan();
                        Navigator.of(context).pop();
                        //Navigator.of(context).build(context);
                        /* LibClass.popupSave(context, 'Simpan Data',
                            'Data telah tersimpan', PropertiList()); */
                        /* LibClass.popAlert(
                            context, 'Simpan Data', 'Data telah tersimpan!'); */
                        /* LibClass.popupSave(context, 'Simpan Data',
                            'Data telah tersimpan', PropertiList()); */
                        /*  LibClass.popAlert(
                            context, 'Simpan Data', 'Data telah tersimpan!');
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return PropertiList();
                          }),
                        ); */
                      } else {
                        //data blm valid
                        log('tidak disave');
                        LibClass.popAlert(context, 'Cek ulang data anda',
                            'data blm valid/lengkap');
                      }
                    },
                    child: const Text(
                      'S I M P A N',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
      ),
      bottomNavigationBar: BotNaviBar(
        parcurrentIndex: 1,
        colour: Color(0xff414643),
      ),
      /* bottomNavigationBar: BottomNavigationBar(
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
      ), */
    );
  }

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
        //return Dashboard(jeneng: widget.namaOwner);
        return halTujuan[index];
      }),
    );
    //Navigator.pushNamed(context, Dashboard(jeneng: 'asd'));
    //debugPrint('asd');
    //debugPrint('chPage function');
  }
}
