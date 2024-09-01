import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:kos/dashboard.dart';
import 'package:kos/usraccount.dart';
import 'package:kos/tagihan.dart';
import 'package:kos/libclass.dart';

class PenghuniEdit extends StatefulWidget {
  //const properti({super.key});
  final String namaKos;

  PenghuniEdit({Key? key, required this.namaKos}) : super(key: key);

  @override
  State<PenghuniEdit> createState() => _PenghuniEditState();
}

class _PenghuniEditState extends State<PenghuniEdit> {
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

  final TextEditingController _dateController = TextEditingController();
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
          "Ubah Data Penghuni" + MyGlobalVariables.userName,
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
                'Nama penghuni',
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
                'No Identitas(KTP/SIM)',
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
                'Tgl Lahir',
                style: const TextStyle(
                  color: Color.fromRGBO(195, 0, 110, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: _dateController,
                onTap: () {
                  _selectDate();
                },
                readOnly: true,
                style: TextStyle(fontSize: 12),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Color(0xffc94b4b))),
                  hintStyle: TextStyle(fontSize: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: "0",
                  prefixIcon: Icon(Icons.calendar_today),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Alamat',
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
      /* bottomNavigationBar: BotNaviBar(
        ownerKos: widget.ownerprop,
        parcurrentIndex: 0,
        colour: Color(0xff414643),
      ), */
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

  /* chPage(index) {
    final halTujuan = [
      Dashboard(jeneng: widget.ownerprop),
      tagihan(),
      usraccount(
        namausr: widget.ownerprop,
      ),
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
  } */

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    if (_picked != null) {
      _dateController.text = _picked.toString().split(" ")[0];
    }
  }
}
