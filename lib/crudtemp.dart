// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';
//import 'package:kos/dashboard.dart';
import 'package:kos/entities/kos.dart';
//import 'package:kos/entities/objectbox.dart';
import 'package:kos/libclass.dart';
import 'package:kos/objectbox.g.dart';
import 'package:kos/main.dart';
//import 'package:kos/libclass.dart';

//Future<void> main() async {
//late Store store;
//void main() async {

//late Store store;
/* Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  late Store store;
  //store = (await ObjectBox.create()).store;
  runApp(MyCRUD());
} */

main() async {
  /*  WidgetsFlutterBinding.ensureInitialized();
  store = (await ObjectBox.create()).store; */

  runApp(MyCRUD());
}

//late Store store;
class MyCRUD extends StatefulWidget {
  //const MyCRUD({super.key});

  /* void initState() async {
    late Store store;
    WidgetsFlutterBinding.ensureInitialized();
    store = (await ObjectBox.create()).store;

    final Box<Propinsi> propinsiBox = store.box<Propinsi>();
    final Box<Kota> kotaBox = store.box<Kota>();
  }
 */
  @override
  State<MyCRUD> createState() => _MyCRUDState();
}

class _MyCRUDState extends State<MyCRUD> {
  /* final Box<Propinsi> propinsiBox = store.box<Propinsi>();
  final Box<Kota> kotaBox = store.box<Kota>();
   */
  //@override
  final Box<Propinsi> propinsiBox = store.box<Propinsi>();
  final Box<Kota> kotaBox = store.box<Kota>();
  final Box<Pemilik> pemilikBox = store.box<Pemilik>();
  final Box<Properti> propertiBox = store.box<Properti>();

  //log(propinsiBox.toString());
  final TextEditingController inputData = TextEditingController();
  @override
  /* initState() {
    log('init ssstate1');
    log('init ssstate');
    log('init ssstate kakak');
    //log('${MyGlobalVariables.userName}');
//    log(MyGlobalVariables.userName);
  } */
  srchKota(idKota) {
    var yamin = kotaBox.getAll();
    for (int i = 0; i < yamin.length; i++) {
      if (idKota == yamin[i].id) {
        return (yamin[i].nama);

        //log('kota : ${yamin[i].nama}');
      }
    }
  }

  Widget build(BuildContext context) {
    return
        /* MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KosKu',
      theme: ThemeData(
          //colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
          fontFamily: 'Roboto',
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffc94b4b)),
          useMaterial3: true), */
        //home: LoginPage(),

        Scaffold(
      //return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                //Scaffold.of(context).openDrawer();
                Navigator.pop(context);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text('CRUD'),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'id : ${MyGlobalVariables.userId}',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  'userName : ${MyGlobalVariables.userName}',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  'alamat : ${MyGlobalVariables.alamat}',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  'kota : ${MyGlobalVariables.kota}',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  'propinsi : ${MyGlobalVariables.propinsi}',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  'userHp : ${MyGlobalVariables.userHp}',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  'userEmail : ${MyGlobalVariables.userEmail}',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              controller: inputData,
            ),
            SizedBox(
              height: 10,
            ),
            Text("Import data"),
            SizedBox(
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

                  List<Propinsi> propinsiList = [
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
                  /* Box<Kota> kotaBox = store!.box<Kota>();*/

                  final insertedIds = kotaBox.putMany(kotalist);

                  final insertedIds2 = propinsiBox.putMany(propinsiList);
                  log(insertedIds.toString());
                  log(insertedIds2.toString());
                },
                child: Text('import')),
            SizedBox(
              height: 10,
            ),
            //==================================================
            ElevatedButton(
                onPressed: () {
                  //log(propertiBox.toString());
                  for (var element in propertiBox.getAll()) {
                    log('${element.id}-${element.pemilikId}-${element.nama}-${element.alamat}-${element.kota}');
                  }
                  /* log(kotaBox.toString());
                  for (var element in kotaBox.getAll()) {
                    log('${element.id}-${element.idPropinsi}-${element.nama}');
                  }
                  log(propinsiBox.toString());
                  for (var element in propinsiBox.getAll()) {
                    log('${element.id} - ${element.nama}');
                  }
                  log(pemilikBox.toString());
                  for (var element in pemilikBox.getAll()) {
                    //log('${element.id} - ${element.namapemilik}');
                    //log(element);
                    //log(element.toString());
                    log('id=${element.id} - nama pemilik=${element.namapemilik} - password=${element.password} - alamat=${element.alamat} - kota=${element.kota} - prop=${element.propinsi} - hp=${element.hp} - email=${element.email} ');
                  } */
                  log("inilah isi dbase");
                },
                child: Text('Retrieve Dataaik')),
            SizedBox(
              height: 10,
            ),
            //===================================================
            ElevatedButton(
                onPressed: () {
                  propertiBox.removeAll();
                  LibClass.popAlert(context, 'Hapus Data', '');

                  //List getIdPemilik = inputData.text.split(',');
                  //List<int> delIdPemilik =getIdPemilik.map((e) => int.parse(e)).toList();
                  //getIdPemilik.map(int.parse).toList();

                  /*  if (delIdPemilik.length > 0) {
                    int id = -1;
                       for (int i = 0; i < delIdPemilik.length; i++) {
                        id = int.tryParse(delIdPemilik[0])??0;
                        if (id > 0) {
                          log(pemilikBox.remove(id));
                        }
        
                      }
                    //log(pemilikBox.removeMany(delIdPemilik).toString());
                    
                  }
 */
                  //final deletedIds = propinsiBox.remove(5);
                  /*  final deletedIds = propinsiBox.removeAll();
                    final deletedIds2 = kotaBox.removeAll(); */
                },
                child: Text('Delete')),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {
                log('hit!');
              },
              child: Text('Hit me'),
            ),
            ElevatedButton(
                onPressed: () {
                  //final deletedIds = propinsiBox.remove(5);
                  /*  final deletedIds = propinsiBox.removeAll();
                    final deletedIds2 = kotaBox.removeAll(); */

                  log('satu');
                  log('dua');
                },
                child: Text('Update')),
          ],
        ),
      ),
      //),
    );
    //);
  }
}
