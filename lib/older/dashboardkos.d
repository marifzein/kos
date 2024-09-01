import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kos/entities/kos.dart';
import 'package:kos/entities/objectbox.dart';
import 'package:kos/objectbox.g.dart';
import 'package:kos/main.dart';


class MyNdas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Application',
      home: Dashboard(),
    );
  }
}

//================================================
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

//================================================
class _DashboardState extends State<Dashboard> {
  final Box<Propinsi> propinsiBox = store.box<Propinsi>();
  final Box<Kota> kotaBox = store.box<Kota>();

  int propidSelected = 0;
  int kotaSelected = 1;

  /* var propidSelected;
  var kotaSelected; */
  /* final List<Map<String, String>> kotaTemp = [
    {"id": "1", "nama": "New Delhi"},
    {"id": "2", "nama": "Washington, D.C."}
  ]; */
  final List<Map<String, String>> kotaTemp = [];
  //var kotaTemp1 = [];
  //final Map kotaTemp = {'1': 'nyu delhi','1': 'denpasar',};

  /* var kotaTemp = [
    {'0', 'pilih kota'}
  ]; */
  /* final List<(String, String)> kotaTemp2 = [
    {"0", "Pilih Kota"}
  ]; */

  //final List kotaTemp = [];
  //final List <Map<String,String>> blung= ["Kota"{"id": "1", "nama": "New Delhi"}];
  //Future _tampilkota(int val) async {

  Future _tampilkota(val) async {
    return setState(() {
      //val = int.parse(val);
      log('macet 1');

      //log('val = $val sedangkan propidSelected = $propidSelected');
      if (propidSelected != val) {
        //kotaSelected = 1;
        log('macet 2');
        //log('Query kalo beda propinsi');
        kotaTemp.clear();
        //var kotaTemp = [];
        QueryBuilder<Kota> builder =
            kotaBox.query(Kota_.idPropinsi.equals(val));
        Query<Kota> query = builder.build();

        var blung = query.find();
        //List blung = query.find();

        log('macet 3 inilah isine kotaTemp seblm blung masuk ke kotatemp');
        //log(blung.toString());
        // blung.map((e) => ({log(e.nama)}));

        /*  List<Map<String, String>> kouta = [
          {"id": "", "nama": ""}
        ]; */
        //kotaTemp1 = blung.cast().toList();
        //kotaTemp.addAll(blung as Iterable<Map<String, String>>);
        //kotaTemp = blung.cast<Set<String>>().toList();
        //==========================iterate
        //blung.forEach((e) {};
        for (int i = 0; i < blung.length; i++) {
          kotaTemp.add({'id': (blung[i].id).toString(), 'nama': blung[i].nama});

          //kotaTemp.add({e.id, e.nama});

          // kotaTemp.add({e.id,e.nama});
        }
        //log('kotaSelected = ' + kotaSelected);
        log('blung ke 0=${blung[0].id}');
        kotaSelected = blung[0].id;
        //iki yo iso
        //print(kotaTemp[0]["nama"]);

        /*  blung.forEach((e) {
          log(e.id.toString() + " - " + e.nama);
        }); */
        log('macet 4 sblm iterassi kotatemp');
        for (var e in kotaTemp) {
          log(e['id'].toString());
          log(e['nama'].toString());
        }

        //log(kotaTemp.toString());
        //log((blung).toString());
        //if (blung.length > 0) {
        /* if (blung.isNotEmpty) {
        
        } */
      }

      propidSelected = val;

      log('macet 4 selectedkota =$kotaSelected selectedProp=$propidSelected');
    });
  }

  @override
  initState() {
    if (propinsiBox.isEmpty() == false) {
      int valui = propinsiBox.getAll().first.id;
      log("initState Called nilai prop ID taks setting $valui");
      _tampilkota(valui);
      kotaSelected = 8;
    } else {
      log('data table/entiti kosong');
    }
  }

  //late final query = kotaBox.query(Kota_.idPropinsi.equals(1000)).build();
  //================================================
  @override
  Widget build(BuildContext context) {
    //return MaterialApp(
    // home: Scaffold(
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dasbrot"),
      ),
      body: Container(
        child: Column(
          children: [
            const Text('Body'),
            /*  SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    /* Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return MyApp();
                    })); */
                  },
                  child: Text("BACK")), */

            const SizedBox(
              height: 10,
            ),
            //===========================
            DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                  hint: const Text('Propinsi'),

                  //value: propidSelected == null ? propidSelected : 1,
                  value: (propinsiBox.isEmpty()
                      ? 0
                      : propinsiBox.getAll().first.id),
                  isDense: true,

                  //focusColor: Color(0xffc94b4b),
                  dropdownColor: const Color.fromARGB(255, 245, 245, 245),
                  icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                  isExpanded: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(CupertinoIcons.location_solid),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  //borderRadius: BorderRadius.all(Radius.circular(10.0)),

                  //items: _propinsilist
                  items: propinsiBox
                      .getAll()
                      .map((e) => DropdownMenuItem(
                            value: e.id,
                            child: Text(e.nama),
                          ))
                      .toList(),
                  onChanged: //(val) {}
                      /*     (val) {
                      _tampilkota(val!); */
                      (val) {
                    _tampilkota(val);
                    //int.parse('12345');
                  }),
            ),
            //===================================================
            DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                value: (kotaTemp.isEmpty ? 0 : kotaTemp[0]["id"]),
                //value: kotaSelected,
                hint: const Text('Kota'),
                dropdownColor: const Color.fromARGB(255, 245, 245, 245),
                icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                isExpanded: true,
                isDense: true,
                decoration: const InputDecoration(
                  //filled: true,
                  //fillColor: Colors.black87,
                  prefixIcon: Icon(CupertinoIcons.location),
                  //border: OutlineInputBorder(
                  //  borderRadius: BorderRadius.all(Radius.circular(15))),
                ),

                items: kotaTemp
                    .map((e) => DropdownMenuItem(
                          value: e['id'],
                          child: Text(e['nama'].toString()),
                        ))
                    .toList(),

                //============================================================
                //kotaSelected

                onChanged: (newValue) {
                  setState(() {
                    //kotaSelected = int.parse(newValue!);
                    //kotaSelected = newValue;
                    log(newValue.toString());
                  });
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Import data"),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  //log('impor');
                  //propinsiBox.put(Propinsi(nama: 'Jawa Timur'));

                  /* List<Propinsi> propinsiList = [
                    Propinsi(
                      nama: 'Jawa Timur',
                    ),
                  ]; */

                  /* List<Propinsi> propinsilist = [
                    Propinsi(
                      nama: 'Jawa Timur',
                    ),
                    Propinsi(
                      nama: 'Jawa Tengah',
                    ),
                    Propinsi(
                      nama: 'Jawa Barat',
                    ),
                    Propinsi(
                      nama: 'Sumatera Barat',
                    ),
                  ]; */
                  List<Propinsi> propolis = [
                    Propinsi(nama: 'Jawa Timur'),
                    Propinsi(nama: 'Jawa Tengah'),
                    Propinsi(nama: 'Jawa Barat'),
                    Propinsi(nama: 'Sumatera Barat'),
                  ];
                  List<Kota> kotalist = [
                    Kota(idPropinsi: 1, nama: 'Bangkalan'),
                    Kota(idPropinsi: 1, nama: 'Banyuwangi'),
                    Kota(idPropinsi: 1, nama: 'Blitar'),
                    Kota(idPropinsi: 1, nama: 'Bojonegoro'),
                    Kota(idPropinsi: 1, nama: 'Bondowoso'),
                    Kota(idPropinsi: 1, nama: 'Gresik'),
                    Kota(idPropinsi: 1, nama: 'Jember'),
                    Kota(idPropinsi: 1, nama: 'Jombang'),
                    Kota(idPropinsi: 1, nama: 'Kediri'),
                    Kota(idPropinsi: 1, nama: 'Lamongan'),
                    Kota(idPropinsi: 1, nama: 'Lumajang'),
                    Kota(idPropinsi: 1, nama: 'Madiun'),
                    Kota(idPropinsi: 1, nama: 'Magetan'),
                    Kota(idPropinsi: 1, nama: 'Malang'),
                    Kota(idPropinsi: 1, nama: 'Mojokerto'),
                    Kota(idPropinsi: 1, nama: 'Nganjuk'),
                    Kota(idPropinsi: 1, nama: 'Ngawi'),
                    Kota(idPropinsi: 1, nama: 'Pacitan'),
                    Kota(idPropinsi: 1, nama: 'Pamekasan'),
                    Kota(idPropinsi: 1, nama: 'Pasuruan'),
                    Kota(idPropinsi: 1, nama: 'Ponorogo'),
                    Kota(idPropinsi: 1, nama: 'Probolinggo'),
                    Kota(idPropinsi: 1, nama: 'Sampang'),
                    Kota(idPropinsi: 1, nama: 'Sidoarjo'),
                    Kota(idPropinsi: 1, nama: 'Situbondo'),
                    Kota(idPropinsi: 1, nama: 'Sumenep'),
                    Kota(idPropinsi: 1, nama: 'Trenggalek'),
                    Kota(idPropinsi: 1, nama: 'Tuban'),
                    Kota(idPropinsi: 1, nama: 'Tulungagung'),
                    Kota(idPropinsi: 1, nama: 'Batu'),
                    Kota(idPropinsi: 1, nama: 'Blitar'),
                    Kota(idPropinsi: 1, nama: 'Kediri'),
                    Kota(idPropinsi: 1, nama: 'Madiun'),
                    Kota(idPropinsi: 1, nama: 'Malang'),
                    Kota(idPropinsi: 1, nama: 'Mojokerto'),
                    Kota(idPropinsi: 1, nama: 'Pasuruan'),
                    Kota(idPropinsi: 1, nama: 'Probolinggo'),
                    Kota(idPropinsi: 1, nama: 'Surabaya'),
                    //jateng
                    Kota(idPropinsi: 2, nama: 'Banjarnegara'),
                    Kota(idPropinsi: 2, nama: 'Banyumas'),
                    Kota(idPropinsi: 2, nama: 'Batang	'),
                    Kota(idPropinsi: 2, nama: 'Blora	'),
                    Kota(idPropinsi: 2, nama: 'Boyolali'),
                    Kota(idPropinsi: 2, nama: 'Brebes	'),
                    Kota(idPropinsi: 2, nama: 'Cilacap'),
                    Kota(idPropinsi: 2, nama: 'Demak	'),
                    Kota(idPropinsi: 2, nama: 'Grobogan'),
                    Kota(idPropinsi: 2, nama: 'Jepara'),
                    Kota(idPropinsi: 2, nama: 'Karanganyar'),
                    Kota(idPropinsi: 2, nama: 'Kebumen'),
                    Kota(idPropinsi: 2, nama: 'Kendal'),
                    Kota(idPropinsi: 2, nama: 'Klaten'),
                    Kota(idPropinsi: 2, nama: 'Kudus	'),
                    Kota(idPropinsi: 2, nama: 'Magelang	'),
                    Kota(idPropinsi: 2, nama: 'Pati	'),
                    Kota(idPropinsi: 2, nama: 'Pekalongan'),
                    Kota(idPropinsi: 2, nama: 'Pemalang	'),
                    Kota(idPropinsi: 2, nama: 'Purbalingga'),
                    Kota(idPropinsi: 2, nama: 'Purworejo	'),
                    Kota(idPropinsi: 2, nama: 'Rembang	'),
                    Kota(idPropinsi: 2, nama: 'Semarang	'),
                    Kota(idPropinsi: 2, nama: 'Sragen	'),
                    Kota(idPropinsi: 2, nama: 'Sukoharjo	'),
                    Kota(idPropinsi: 2, nama: 'Tegal	'),
                    Kota(idPropinsi: 2, nama: 'Temanggung	'),
                    Kota(idPropinsi: 2, nama: 'Wonogiri'),
                    Kota(idPropinsi: 2, nama: 'Wonosobo'),
                    Kota(idPropinsi: 2, nama: 'Magelang	'),
                    Kota(idPropinsi: 2, nama: 'Pekalongan	'),
                    Kota(idPropinsi: 2, nama: 'Salatiga'),
                    Kota(idPropinsi: 2, nama: 'Semarang'),
                    Kota(idPropinsi: 2, nama: 'Surakarta	'),
                    Kota(idPropinsi: 2, nama: 'Tegal'),
                    //===================================
                    Kota(idPropinsi: 3, nama: 'Bandung'),
                    Kota(idPropinsi: 3, nama: 'BandungBarat'),
                    Kota(idPropinsi: 3, nama: 'Bekasi'),
                    Kota(idPropinsi: 3, nama: 'Bogor'),
                    Kota(idPropinsi: 3, nama: 'Ciamis'),
                    Kota(idPropinsi: 3, nama: 'Cianjur'),
                    Kota(idPropinsi: 3, nama: 'Cirebon'),
                    Kota(idPropinsi: 3, nama: 'Garut'),
                    Kota(idPropinsi: 3, nama: 'Indramayu'),
                    Kota(idPropinsi: 3, nama: 'Karawang'),
                    Kota(idPropinsi: 3, nama: 'Kuningan'),
                    Kota(idPropinsi: 3, nama: 'Majalengka'),
                    Kota(idPropinsi: 3, nama: 'Pangandaran'),
                    Kota(idPropinsi: 3, nama: 'Purwakarta'),
                    Kota(idPropinsi: 3, nama: 'Subang'),
                    Kota(idPropinsi: 3, nama: 'Sukabumi'),
                    Kota(idPropinsi: 3, nama: 'Sumedang'),
                    Kota(idPropinsi: 3, nama: 'Tasikmalaya'),
                    Kota(idPropinsi: 3, nama: 'Bandung'),
                    Kota(idPropinsi: 3, nama: 'Banjar'),
                    Kota(idPropinsi: 3, nama: 'Bekasi'),
                    Kota(idPropinsi: 3, nama: 'Bogor'),
                    Kota(idPropinsi: 3, nama: 'Cimahi'),
                    Kota(idPropinsi: 3, nama: 'Cirebon'),
                    Kota(idPropinsi: 3, nama: 'Depok'),
                    Kota(idPropinsi: 3, nama: 'Sukabumi'),
                    Kota(idPropinsi: 3, nama: 'Tasikmalaya'),
                    //=======================================
                    Kota(idPropinsi: 4, nama: 'Lubuk Basung'),
                    Kota(idPropinsi: 4, nama: 'Dharmasraya'),
                    Kota(idPropinsi: 4, nama: 'Kepulauan Mentawai'),
                    Kota(idPropinsi: 4, nama: 'Lima Puluh Kota'),
                    Kota(idPropinsi: 4, nama: 'Padang Pariaman'),
                    Kota(idPropinsi: 4, nama: 'Pasaman'),
                    Kota(idPropinsi: 4, nama: 'Pasaman Barat'),
                    Kota(idPropinsi: 4, nama: 'Pesisir Selatan'),
                    Kota(idPropinsi: 4, nama: 'Sijunjung'),
                    Kota(idPropinsi: 4, nama: 'Solok'),
                    Kota(idPropinsi: 4, nama: 'Solok Selatan'),
                    Kota(idPropinsi: 4, nama: 'Tanah Datar'),
                    Kota(idPropinsi: 4, nama: 'Bukittinggi'),
                    Kota(idPropinsi: 4, nama: 'Padang'),
                    Kota(idPropinsi: 4, nama: 'Padang Panjang'),
                    Kota(idPropinsi: 4, nama: 'Pariaman'),
                    Kota(idPropinsi: 4, nama: 'Payakumbuh'),
                    Kota(idPropinsi: 4, nama: 'Sawahlunto'),
                    Kota(idPropinsi: 4, nama: 'Solok'),
                  ];
                  //Box<Propinsi> propinsiBox = store.box<Propinsi>();
                  //Box<Propinsi> propinsiBox = store!.box<Propinsi>();
                  // Box<Kota> kotaBox = store!.box<Kota>();

                  final insertedIds = kotaBox.putMany(kotalist);

                  final belungkakak = propinsiBox.putMany(propolis);
                  //propinsiBox.putMany(propinsilist);
                  //log(insertedIds.toString());
                },
                child: const Text('import')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Dashboard1();
                  }));
                },
                child: const Text('ke hal Main')),
          ],
        ),
      ),
    );
    //);
  }
}