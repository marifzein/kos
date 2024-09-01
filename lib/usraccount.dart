import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
//import 'package:flutter/widgets.dart';
import 'package:kos/dashboard.dart';
//import 'package:kos/login.dart';
import 'package:kos/tagihan.dart';
import 'package:kos/entities/kos.dart';
import 'package:kos/objectbox.g.dart';
import 'package:kos/libclass.dart';
import 'package:kos/main.dart';

final _formkeyUsr = GlobalKey<FormState>();

class usraccount extends StatefulWidget {
  //const properti({super.key});

  usraccount({Key? key}) : super(key: key);

  @override
  State<usraccount> createState() => _usraccountState();
}

class _usraccountState extends State<usraccount> {
  final TextEditingController _namapemilik =
      TextEditingController(text: MyGlobalVariables.userName);
  final TextEditingController _alamat =
      TextEditingController(text: MyGlobalVariables.alamat);
  final TextEditingController _telp =
      TextEditingController(text: MyGlobalVariables.userHp);
  final TextEditingController _email =
      TextEditingController(text: MyGlobalVariables.userEmail);

  final Box<Propinsi> propinsiBox = store.box<Propinsi>();
  final Box<Kota> kotaBox = store.box<Kota>();
  final Box<Pemilik> pemilikBox = store.box<Pemilik>();

  /* int propinsiku = 0;
  int kotaku = 1; */
  //int propinsiku = MyGlobalVariables.propinsi;
  int propinsiku = -1;
  int kotaku = MyGlobalVariables.kota;

  final List<Map<String, String>> kotaTemp = [];

  var idUser;
  //======================================================
  String? validateHP(String? valui) {
//    const pattern = r'^(\+62|62|0)8[1-9][0-9]{6,9}$';
    const pattern = r'^(0)8[1-9][0-9]?(\d{7,9})$';
    final regex = RegExp(pattern);
    if (valui!.length == 0) {
      return '*Harus diisi';
    } else if (!regex.hasMatch(valui!)) {
      return 'Masukkan No HP yang valid';
    } else {
      return null;
    }
  }

  //========================================================
  String? validateEmail(String? valui) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    /* return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Masukkan email yang valid (misal:anda@gmail.com)'
        : null; */
    if (valui!.length == 0) {
      return '*Harus diisi';
    } else if (!regex.hasMatch(valui!)) {
      return 'Masukkan e-mail yang valid';
    } else {
      return null;
    }
  }

  //=================================================
  bool _cekEmail(val) {
//===check if email existed
    QueryBuilder<Pemilik> builder =
        pemilikBox.query(Pemilik_.email.equals(val));
    Query<Pemilik> query = builder.build();

    var hsl = query.find();
    if (hsl.length > 0) {
      //==============email sudah dipake

      return true;
    } else {
      return false;
    }
  }

  bool _cekHP(val) {
//===check if phone existed
    QueryBuilder<Pemilik> builder = pemilikBox.query(Pemilik_.hp.equals(val));
    Query<Pemilik> query = builder.build();

    var hsl = query.find();
    if (hsl.length > 0) {
      //==============telepon sudah dipake
      // log('telp dobel');
      return true;
    } else {
      return false;
    }
  }

  //========================================================
  String getPwd() {
    QueryBuilder<Pemilik> builder = pemilikBox.query(Pemilik_.email
        .equals(MyGlobalVariables.userEmail)
        .and(Pemilik_.hp.equals(MyGlobalVariables.userHp)));
    Query<Pemilik> query = builder.build();
    String pwd = '';
    var hsl = query.find();
    if (hsl.length > 0) {
      //==============email dan password cocok
      //log(hsl.toString());
      int idUser = hsl[0].id;
      pwd = hsl[0].password;
      /*  MyGlobalVariables.userId = hsl[0].id;
      MyGlobalVariables.userName = hsl[0].namapemilik;
      MyGlobalVariables.userEmail = hsl[0].email;
      MyGlobalVariables.userHp = hsl[0].hp;
      MyGlobalVariables.alamat = hsl[0].alamat;
      MyGlobalVariables.kota = hsl[0].kota;
      MyGlobalVariables.propinsi = hsl[0].propinsi; */
    }
    return pwd;
  }

  Future _tampilkota(int val) async {
    return setState(() {
      //val = int.parse(val);
      log('macet 1');
      log(MyGlobalVariables.kota.toString());

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

        //log('macet 3 inilah isine kotaTemp seblm blung masuk ke kotatemp');

        //==========================iterate
        //blung.forEach((e) {};
        for (int i = 0; i < blung.length; i++) {
          kotaTemp.add({'id': (blung[i].id).toString(), 'nama': blung[i].nama});

          //kotaTemp.add({e.id, e.nama});

          // kotaTemp.add({e.id,e.nama});
        }
        //log('kotaSelected = ' + kotaSelected);
        //log('blung ke 0=${blung[0].id}');
        kotaku = blung[0].id;
        //kotaku = MyGlobalVariables.kota;
        //iki yo iso
        //print(kotaTemp[0]["nama"]);

        /*  blung.forEach((e) {
          log(e.id.toString() + " - " + e.nama);
        }); */
        log('isinya kotatemp');
        for (var e in kotaTemp) {
          log(e['id'].toString());
          log(e['nama'].toString());
        }
      }

      propinsiku = val;

      log('macet 4 selectedkota =$kotaku selectedProp=$propinsiku');
    });
  }

  @override
  initState() {
    if (propinsiBox.isEmpty() == false) {
      /*  int valui = propinsiBox.getAll().first.id;
      log("initState Called nilai prop ID taks setting $valui");
      _tampilkota(valui);
      kotaku = 8; */
      _tampilkota(MyGlobalVariables.propinsi);
      kotaku = MyGlobalVariables.kota;
      log('kotaku $kotaku');
      //log('inilah initstate  ${MyGlobalVariables.propinsi} -  ${MyGlobalVariables.kota}');
//      log('inilah initstate kotaku yak o ${MyGlobalVariables.propinsi}');
      // log((MyGlobalVariables.kota).toString());

      //log(kotaku.toString());
      //int idUser = 1;
    } else {
      log('data table/entiti kosong');
    }
  }

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
        title: 'Akun User',
        subtitle: 'Lengkapi data anda',
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5),
          margin: new EdgeInsets.symmetric(vertical: 50.0),
          child: Form(
            key: _formkeyUsr,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //NAMA PROPERTI
                Text(
                  'Pemilik Properti',
                  style: const TextStyle(
                    //color: Color.fromARGB(255, 195, 0, 110),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),

                TextFormField(
                  //style: TextStyle(fontSize: 12),
                  validator: (name) =>
                      name!.length < 3 ? 'Nama minimal 4 huruf' : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _namapemilik,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 15),
                    /* border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ), */
                    hintText: "",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 30),
                //ALAMAT
                Text(
                  'Alamat',
                  style: const TextStyle(
                    //color: Color.fromARGB(255, 195, 0, 110),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //const SizedBox(height: 5),

                TextFormField(
                  controller: _alamat,
                  validator: (alamat) => alamat!.length < 10
                      ? 'Alamat minimal 10 huruf/angka'
                      : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(fontSize: 15),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 15),
                    /* border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ), */
                    hintText: "",
                    prefixIcon: Icon(Icons.location_on_outlined),
                  ),
                ),
                const SizedBox(height: 10),
                //Propinsi
                Text(
                  'Propinsi',
                  style: const TextStyle(
                      //color: Color.fromARGB(255, 195, 0, 110),
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                const SizedBox(height: 5),
                DropdownButtonFormField(
                    hint: Text('Propinsi'),
                    /* value: (propinsiBox.isEmpty()
                        ? 0
                        : propinsiBox.getAll().first.id), */
                    value: MyGlobalVariables.propinsi,
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
                        log(kotaku.toString());
                      });
                    }),

                const SizedBox(height: 30),
                Center(
                  child: Text(
                    'Perhatian : Email anda adalah sebagai Username saat login',
                    style: TextStyle(color: Color.fromARGB(255, 0, 53, 122)),
                  ),
                ),
                const SizedBox(height: 10),
                //ALAMAT
                Text(
                  'Telp/HP',
                  style: const TextStyle(
                    //color: Color.fromARGB(255, 195, 0, 110),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                //const SizedBox(height: 5),

                TextFormField(
                  controller: _telp,
                  validator: validateHP,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(fontSize: 15),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 15),
                    /* border: OutlineInputBorder( 
                    borderRadius: BorderRadiu  s.circular(15.0),
                     ), */
                    hintText: "",
                    prefixIcon: Icon(Icons.phone_android),
                  ),
                ),

                const SizedBox(height: 30),
                //email
                Text(
                  'Email',
                  style: const TextStyle(
                    // color: Color.fromARGB(255, 195, 0, 110),
                    fontWeight: FontWeight.bold, fontSize: 12,
                  ),
                ),
                //const SizedBox(height: 5),

                TextFormField(
                  controller: _email,
                  validator: validateEmail,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(fontSize: 15),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 15),
                    /* border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ), */
                    hintText: "",
                    prefixIcon: Icon(Icons.email_rounded),
                  ),
                ),
                const SizedBox(height: 20),

                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      fixedSize: Size(200, 50),
                      backgroundColor: Color(0xff3b7b7a),
                      foregroundColor: Colors.white,
                      splashFactory: InkSplash.splashFactory,
                    ),
                    //onPressed: fncParam,
                    onPressed: () {
                      /*  if (_cekHP(_telp.text) == true ||
                          _cekEmail(_email.text) == true) {
                        LibClass.popAlert(context, 'Cek ulang data anda',
                            'No Telp/HP atau email yang anda masukkan sudah pernah dipakai');
                      } else { */
                      //log(_formkey.currentState!.validate().toString());

                      //log('telepon sdh ada di dbase');
                      if (_formkeyUsr.currentState!.validate()) {
                        //stackoverflow==========
                        log('waiki');
                        final pemilikUpdate =
                            pemilikBox.get(MyGlobalVariables.userId)!;

                        pemilikUpdate.namapemilik = _namapemilik.text;
                        pemilikUpdate.alamat = _alamat.text;
                        pemilikUpdate.email = _email.text;
                        pemilikUpdate.hp = _telp.text;
                        pemilikUpdate.propinsi = propinsiku;
                        pemilikUpdate.kota = kotaku;
                        pemilikBox.put(pemilikUpdate);
                        LibClass.popAlert(
                            context, 'Simpan Data', 'Data telah tersimpan!');

                        MyGlobalVariables.userName = _namapemilik.text;
                        MyGlobalVariables.alamat = _alamat.text;
                        MyGlobalVariables.userEmail = _email.text;
                        MyGlobalVariables.userHp = _telp.text;
                        MyGlobalVariables.propinsi = propinsiku;
                        MyGlobalVariables.kota = kotaku;

                        //stack end=============
//muali update
                        /* QueryBuilder<Pemilik> builder = pemilikBox.query(
                            Pemilik_.id.equals(MyGlobalVariables.userId));
                        Query<Pemilik> query = builder.build(); */

                        /*  var hsl = query.find();
                        bool stat = false;
                        for (int i = 0; i < hsl.length; i++) {
                          if (stat == MyGlobalVariables.userId) {
                            //log((hsl[i].id).toString());
                          }
                        } */

                        /* kotaTemp.add({
                            'id': (hsl[i].id).toString(),
                            'nama': hsl[i].nama
                          }); */

                        //log("proses simpan se");
                        /* pemilikBox.getAll().map((e) {
                          log('id = ${e.id} - ${e.namapemilik}');
                        }); */
                        //log('id = ${e.id} - ${e.namapemilik}');
                        //log('nama = ${e.namapemilik}');
                        //try {
                        /* pemilikBox.getAll().map((e) {
                            log('id = ${e.id} - ${e.namapemilik}');
                          
                          }); */
                        /* log('piye1');
                        log(getPwd().toString());
                        log('piye2'); */
                        /* pemilikBox.put(Pemilik(
                            id: MyGlobalVariables.userId,
                            namapemilik: _namapemilik.text,
                            password: getPwd(),
                            //password: 'apapunasalhalal1',
                            alamat: _alamat.text,
                            kota: kotaku,
                            propinsi: propinsiku,
                            hp: _telp.text,
                            email: _email.text
                            //hp: MyGlobalVariables.userHp,
                            //email: MyGlobalVariables.userEmail,
                            )); */

                        //_popupSave();
                      }
                      /*  log('nama input : ${_namapemilik.text}'); 
                        // } catch (e) {
                        // _popupSaveError(e);
                        //}
                          if (insertedPemilik == true) {
                          _popupSave();
                        } else {
                          _popupSaveError();
                        } */
                      /*  } else {
                        LibClass.popAlert(context, 'Cek ulang data anda',
                            'data blm valid/lengkap');
                      } */
                      //}
                    },
                    child: Text(
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

      bottomNavigationBar: BotNaviBar(
        parcurrentIndex: 1,
        colour: Color(0xff414643),
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
        //return Dashboard(jeneng: widget.namausr);
        return halTujuan[index];
      }),
    );
    //Navigator.pushNamed(context, Dashboard(jeneng: 'asd'));
    //debugPrint('asd');
    //debugPrint('chPage function');
  }

  void _popupSave() {
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(milliseconds: 1100), () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) {
                return Dashboard();
              }),
            );
          });

          //===showalert
          return AlertDialog(
            alignment: Alignment.center,
            title: Center(
              child: Text(
                'Simpan data Akun',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            content: SizedBox(
              height: 40,
              child: Center(
                child: Text(
                  'Data berhasil disimpan...',
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

  void _popupSaveError(e) {
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(milliseconds: 1100), () {
            Navigator.pop(context);
          });

          //===showalert
          return AlertDialog(
            alignment: Alignment.center,
            title: Center(
              child: Text(
                'Data tidak tersimpan',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            content: SizedBox(
              height: 40,
              child: Center(
                child: Text(
                  'Ada kesalahan $e',
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
}
