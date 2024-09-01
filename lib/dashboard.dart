import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kos/libclass.dart';
//import 'package:flutter/services.dart';
//import 'package:flutter/widgets.dart';
import 'package:kos/login.dart';
//import 'package:kos/property.dart';
import 'package:kos/kamar.dart';
import 'package:kos/objectbox.g.dart';
import 'package:kos/penghuni.dart';
import 'package:kos/tagihan.dart';
import 'package:kos/about.dart';
import 'package:kos/pembayaran.dart';
import 'package:kos/usraccount.dart';
import 'package:kos/testing1.dart';
import 'package:kos/testing.dart';
import 'package:kos/daftar_property.dart';
import 'package:kos/new.dart';
import 'package:kos/crudtemp.dart';
import 'package:kos/main.dart';
import 'package:kos/entities/kos.dart';
//import 'package:kos/entities/objectbox.dart';

//import 'package:kos/objectbox.g.dart';
//import 'package:kos/entities/objectbox.dart';

//late Store store;

/*void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(Dashboard(name: '',));
}*/

class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
  });

//  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //String jan = "jon";
    //const String jan = 'jin';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dasboard - Kosku",
      //theme: ThemeData(primarySwatch: Colors.indigo),
//theme: ThemeData(primarySwatch:Color.fromARGB(255, 195, 0, 110),
      theme: ThemeData(
        primarySwatch: Colors.pink,
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      //home: HomeScreen(),
      home: HomeScreen(),
    );
  }
}

//===============================================
class HomeScreen extends StatefulWidget {
  // final String name;
  //final int idUser;
  //const HomeScreen({Key? key}) : super(key: key);
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  // final String name;

  //const HomeScreen({super.key, required this.name});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//================================================
class _HomeScreenState extends State<HomeScreen> {
  //_HomeScreenState(String name);
  final Box<Pemilik> pemilikBox = store.box<Pemilik>();

  @override
  /*  void initState() {
    // TODO: implement initState
    super.initState();
    QueryBuilder<Pemilik> builder =
        pemilikBox.query(Pemilik_.email.equals(widget.name));
    Query<Pemilik> query = builder.build();

    var hsl = query.find();
    if (hsl.length > 0) {
      log(hsl.toString());
      //String namapemilik = hsl[1].namapemilik;
    } else {
      showDialog(
          context: context,
          builder: (context) {
            Future.delayed(Duration(milliseconds: 1100), () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }),
              );
            });

            //===showalert
            return AlertDialog(
              alignment: Alignment.center,
              title: Center(
                child: Text(
                  'Waktu anda habis',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              content: SizedBox(
                height: 40,
                child: Center(
                  child: Text(
                    'Silahkan Login',
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
  } */

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              //height: 100,
              decoration: BoxDecoration(
                //color: Theme.of(context).primaryColor,
                //color: Color.fromARGB(255, 195, 0, 110),
                color: Color(0xffc94b4b),
                //color: Colors.amber,
                //borderRadius:
                //BorderRadius.only(bottomRight: Radius.circular(50)),
                /*BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),*/
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                    title: Text(
                      'Halo ' + MyGlobalVariables.userName,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white),
                    ),
                    subtitle: Text(
                      'Semoga hari ini aktivitas anda lancar ya!:)',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white70),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => usraccount()));
                        //do what you want here
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/img/avatar.png'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            Container(
              //color: Theme.of(context).primaryColor,
              //color: Color.fromARGB(255, 195, 0, 110),
              color: Color(0xffc94b4b),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50) //lengkungan pojok kiri atas
                      ),
                ),
                child: GridView.count(
                  //padding: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.fromLTRB(5, 10, 10, 5),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    itemDashboard(
                        'Property',
                        CupertinoIcons.house_fill,
                        //                      Colors.deepOrange, properti(jenengprop: widget.name)),
                        Colors.deepOrange,
                        PropertiList()),
                    itemDashboard(
                        'Kamar',
                        CupertinoIcons.bed_double,
                        Colors.green,
                        KamarList()),
                    itemDashboard(
                        'Penghuni',
                        CupertinoIcons.person_2_fill,
                        Colors.purple,
                        Penghuniclass()),
                    itemDashboard(
                        'Pembayaran',
                        CupertinoIcons.money_dollar_circle,
                        Colors.brown,
                        pembayaran()),
                    itemDashboard(
                        'Tagihan',
                        CupertinoIcons.book_circle_fill,
                        Colors.teal,
                        tagihan()),
                    itemDashboard('About', CupertinoIcons.question_circle_fill,
                        Colors.pink, about()),
                    itemDashboard(
                        'Testing',
                        CupertinoIcons.question_circle_fill,
                        const Color.fromARGB(255, 30, 233, 169),
                        testing1()),
                    itemDashboard(
                        'Testing2',
                        CupertinoIcons.question_circle_fill,
                        Color.fromARGB(255, 125, 5, 107),
                        testing()),
                    itemDashboard(
                        'New.dart',
                        CupertinoIcons.question_circle_fill,
                        Colors.purpleAccent,
                        myNewApp()),
                    itemDashboard('CRUD Objectbox', CupertinoIcons.lock,
                        const Color.fromARGB(255, 64, 161, 251), MyCRUD()),
                    itemDashboard('LogOut', CupertinoIcons.lock,
                        const Color.fromARGB(255, 64, 161, 251), LoginPage()),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  itemDashboard(String title, IconData icondata, Color background, halTujuan) =>
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  //offset: const Offset(0, 5),
                  offset: const Offset(3, 10),
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: InkWell(
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            //print("pressed");

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return halTujuan;
              }),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration:
                    BoxDecoration(color: background, shape: BoxShape.circle),
                child: Icon(icondata, color: Colors.white),
              ),
              const SizedBox(height: 2),
              //Text(title, style: Theme.of(context).textTheme.titleMedium)
              Text(title, style: Theme.of(context).textTheme.titleSmall)
            ],
          ),
        ),
      );
}
