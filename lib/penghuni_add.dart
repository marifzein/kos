import 'dart:ui';
import 'package:stack_trace/stack_trace.dart' as stacktrace;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:kos/dashboard.dart';
import 'package:kos/usraccount.dart';
import 'package:kos/tagihan.dart';
import 'package:kos/libclass.dart';

class PenghuniAdd extends StatefulWidget {
  final int idProperti;
  //const properti({super.key});

  PenghuniAdd({Key? key, required this.idProperti}) : super(key: key);

  @override
  State<PenghuniAdd> createState() => _PenghuniAddState();
}

class _PenghuniAddState extends State<PenghuniAdd> {
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

  /// Returns an absolute path to the caller's `.dart` file.
  String currentDartFilePath() => stacktrace.Frame.caller(1).uri.toFilePath();

  /// Returns a path to the caller's `.dart` file, relative to the package root.
  String currentPackageRelativePath() => stacktrace.Frame.caller(1).library;

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
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tambah Penghuni baru",
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //NAMA PROPERTI
              Text(
                'Nama Penghuni',
                style: const TextStyle(
                  color: Color.fromARGB(255, 195, 0, 110),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                //style: TextStyle(fontSize: 12),

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
              const SizedBox(height: 10),
              Text(
                'No Indentitas(KTP/SIM)',
                style: const TextStyle(
                  color: Color.fromARGB(255, 195, 0, 110),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                //style: TextStyle(fontSize: 12),

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
              const SizedBox(height: 10),
              //ALAMAT
              Text(
                'Tgl Lahir',
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
              Text(
                'Alamat',
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
                  icon: const Icon(Icons.arrow_drop_down),
                  isExpanded: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(CupertinoIcons.location_solid),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  //borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  items: _propinsi
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {}),
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

                  //color: Color.fromARGB(255, 195, 0, 110),
                  hint: Text('Kota'),
                  icon: const Icon(Icons.arrow_drop_down),
                  isExpanded: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(CupertinoIcons.location),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  //borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  items: _kota
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {}),

              const SizedBox(height: 10),
              Text(
                'Telp/HP',
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
                  prefixIcon: Icon(Icons.phone_android),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Pekerjaan',
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
                  prefixIcon: Icon(Icons.work),
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
      bottomNavigationBar: BotNaviBar(
        parcurrentIndex: 1,
        colour: Color(0xff414643),
      ),
    );
  }

  /* chPage(index) {
    final halTujuan = [
      Dashboard(jeneng: widget.namaOwner),
      tagihan(),
      usraccount(
        namausr: widget.namaOwner,
      ),
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
  } */
}
