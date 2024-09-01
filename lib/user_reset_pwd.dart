import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:kos/libclass.dart';
import 'package:kos/login.dart';

class usrRegister extends StatefulWidget {
  //const properti({super.key});
  final String namausr;

  usrRegister({Key? key, required this.namausr}) : super(key: key);

  @override
  State<usrRegister> createState() => _usrRegisterState();
}

class _usrRegisterState extends State<usrRegister> {
  final TextEditingController _namapemilik =
      TextEditingController(text: 'Fulan');
  final TextEditingController _alamat =
      TextEditingController(text: 'Jalan Pahlawan 1');
  final TextEditingController _telp =
      TextEditingController(text: '088811112222');
  final TextEditingController _email =
      TextEditingController(text: 'anda@gmail.com');

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

  int currentIndex = 0;

  Widget build(BuildContext context) {
    /*  return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Montserrat',
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold( */
    return Scaffold(
      //return Scaffold(
      appBar: AppBarForm(
        title: 'Reset Password',
        subtitle: 'Masukkan email anda',
      ),
      /* appBar: AppBar(
        elevation: 10,
        shadowColor: Colors.black,
        leading: BackButton(color: Colors.white),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        title: Text(
          "Profil : samidi" + widget.namausr,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
          flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                //colors: [Color(0xff0096ff), Color(0xff6610f2)],
                colors: [Color.fromARGB(255, 195, 0, 110), Color(0xff6610f2)],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight),
           ),
        ),
      ), */
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5),
          margin: new EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //NAMA PROPERTI

              const SizedBox(height: 10),
              //email
              Text(
                'Email',
                style: const TextStyle(
                  // color: Color.fromARGB(255, 195, 0, 110),
                  fontWeight: FontWeight.bold, fontSize: 12,
                ),
              ),
              const SizedBox(height: 5),

              TextField(
                controller: _email,
                style: TextStyle(fontSize: 12),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: "anda@gmail.com",
                  prefixIcon: Icon(Icons.email_rounded),
                ),
              ),
              const SizedBox(height: 20),
              ButtonSimpan(
                /* pgTujuan: usrRegister(
                  namausr: widget.namausr,
                ), */
                pgTujuan: LoginPage(), ownerKos: '',
                //ownerKos: widget.namausr,
              ),
              /*  fncParam: () {
                  print("ok siap pak"); */

              //),
              /* Center(
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
              ), */
            ],
          ),
        ),
      ),
      /* bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white60,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.deepPurple[400],
        iconSize: 35,
        //onTap: (index) => setState(() => currentIndex = index),

        /*onTap: (index) => setState(
          () => chPage(index),
        ),*/

        onTap: (index) => {
          setState(() {
            chPage(index);
          })
        },

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

      bottomNavigationBar: BotNaviBar(
        
        parcurrentIndex: 1,
        colour: Color(0xff414643),
      ),
    );
  }

  chPage(index) {
    /* final halTujuan = [
      Dashboard(jeneng: widget.namausr),
      tagihan(),
      usraccount(
        namausr: widget.namausr,
      ),
    ];
 */
    setState(() => currentIndex = index);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        //return Dashboard(jeneng: widget.namausr);
        //return halTujuan[index];
        return LoginPage();
      }),
    );
    //Navigator.pushNamed(context, Dashboard(jeneng: 'asd'));
    //debugPrint('asd');
    //debugPrint('chPage function');
  }
}
