import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:kos/dashboard.dart';
import 'package:kos/libclass.dart';
import 'package:kos/usraccount.dart';
import 'package:kos/tagihan.dart';

class KamarEdit extends StatefulWidget {
  //const properti({super.key});
  //final String ownerprop;
  final String namaKos;

  KamarEdit({Key? key, required this.namaKos}) : super(key: key);

  @override
  State<KamarEdit> createState() => _KamarEditState();
}

//=================================================
class _KamarEditState extends State<KamarEdit> {
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
          "kamar_edit.dart " + MyGlobalVariables.userName,
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
                widget.namaKos,
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Tipe Kamar',
                style: const TextStyle(
                  color: Color.fromARGB(255, 195, 0, 110),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                widget.namaKos,
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),
              //ALAMAT
              Text(
                'Fasilitas Kamar',
                style: const TextStyle(
                  color: Color.fromRGBO(195, 0, 110, 1),
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
                  hintText: "",
                  prefixIcon: Icon(Icons.bedroom_parent),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Tarif /Bulan',
                style: const TextStyle(
                  color: Color.fromRGBO(195, 0, 110, 1),
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
                  hintText: "0",
                  prefixIcon: Icon(Icons.attach_money),
                ),
              ),

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
