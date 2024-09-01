import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kos/entities/kos.dart';
import 'package:kos/libclass.dart';
import 'package:kos/login.dart';
import 'package:kos/objectbox.g.dart';
import 'package:kos/main.dart';

//late Store store;
//late Store? store;
main() async {
  /*  WidgetsFlutterBinding.ensureInitialized();
  store = (await ObjectBox.create()).store; */

  runApp(const usrRegister(
    namausr: '',
  ));
}

//==========================================================
class usrRegister extends StatefulWidget {
  final namausr;
  const usrRegister({super.key, this.namausr});

  @override
  State<usrRegister> createState() => _usrRegisterState();
}

//==============================================
class _usrRegisterState extends State<usrRegister> {
  final TextEditingController _namapemilik = TextEditingController(text: '');
  final TextEditingController _password = TextEditingController(text: '');
  final TextEditingController _alamat = TextEditingController(text: '');
  final TextEditingController _telp = TextEditingController(text: '');
  final TextEditingController _email = TextEditingController(text: '');
  final TextEditingController _passwordKonfirmasi =
      TextEditingController(text: '');
  bool _isHidden = true;
  bool _isHiddenKonfirmasi = true;
  final _formkey = GlobalKey<FormState>();
//==========================================
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

//==========================================
  void _togglePasswordViewKonfirmasi() {
    setState(() {
      _isHiddenKonfirmasi = !_isHiddenKonfirmasi;
    });
  }

//==========================================
  String? validatePwdKonfirmasi(String? valui) {
    const pattern = r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    final regex = RegExp(pattern);
    /* log('Password konfirmasi harus sama dengan password value=$valui sedangkan pwd=' +
        _password.text); */
    if (valui!.length == 0) {
      return '*Password Harus diisi';
    } else if (!regex.hasMatch(valui!)) {
      return 'Password minimal 8 karakter, kombinasi huruf dan angka';
    } else if (valui != _password.text) {
      //log(_password.value.toString());
      return 'Password konfirmasi harus sama dengan password';
    } else {
      return null;
    }

    /*  return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Masukkan no HP yang valid!'
        : null; */
  }

  String? validatePwd(String? valui) {
    const pattern = r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    final regex = RegExp(pattern);
    if (valui!.length == 0) {
      return '*Password Harus diisi';
    } else if (!regex.hasMatch(valui!)) {
      return 'Password minimal 8 karakter, kombinasi huruf dan angka';
    } else {
      return null;
    }

    /*  return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Masukkan no HP yang valid!'
        : null; */
  }

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

    /*  return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Masukkan no HP yang valid!'
        : null; */
  }

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

  final Box<Propinsi> propinsiBox = store.box<Propinsi>();
  final Box<Kota> kotaBox = store.box<Kota>();
  final Box<Pemilik> pemilikBox = store.box<Pemilik>();
  int propinsiku = 0;
  int kotaku = 1;
  final List<Map<String, String>> kotaTemp = [];
//=================================================
  bool _cekEmail(val) {
//===check if phone existed
    QueryBuilder<Pemilik> builder =
        pemilikBox.query(Pemilik_.email.equals(val));
    Query<Pemilik> query = builder.build();

    var hsl = query.find();
    if (hsl.length > 0) {
      //==============telepon sudah dipake
      return true;
    } else {
      return false;
    }
  }

//=========================================
  bool _cekHP(val) {
//===check if phone existed
    QueryBuilder<Pemilik> builder = pemilikBox.query(Pemilik_.hp.equals(val));
    Query<Pemilik> query = builder.build();

    var hsl = query.find();
    if (hsl.length > 0) {
      //==============telepon sudah dipake
      return true;
    } else {
      return false;
    }
  }

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

          //kotaTemp.add({e.id, e.nama});

          // kotaTemp.add({e.id,e.nama});
        }
        //log('kotaSelected = ' + kotaSelected);
        log('blung ke 0=${blung[0].id}');
        kotaku = blung[0].id;
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
      }

      propinsiku = val;

      log('macet 4 selectedkota =$kotaku selectedProp=$propinsiku');
    });
  }

  @override
  initState() {
    if (propinsiBox.isEmpty() == false) {
      int valui = propinsiBox.getAll().first.id;
      log("initState Called nilai prop ID taks setting $valui");
      _tampilkota(valui);
      kotaku = 8;
    } else {
      log('data table/entiti kosong');
    }
  }
  /*  Widget build(BuildContext context) {
    return const Placeholder();
  } */

  Widget build(BuildContext context) {
    return Scaffold(
      //return Scaffold(
      appBar: AppBarForm(
          title: 'Akun /Pengguna Baru',
          subtitle: 'Lengkapi data anda',
          backpage: LoginPage()),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: new EdgeInsets.symmetric(vertical: 30.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //NAMA PROPERTI
                LabelInput(
                  text: 'Nama User/Pemilik Kost',
                ),

                // const SizedBox(height: 5),
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
                LabelInput(
                  text: 'Masukkan Password',
                ),
                // const SizedBox(height: 30),
                TextFormField(
                  obscureText: _isHidden,
                  controller: _password,
                  validator: validatePwd,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(fontSize: 15),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 15),
                    /* border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ), */
                    hintText: "",
                    prefixIcon: Icon(Icons.lock_rounded),
                    suffix: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(
                          _isHidden
                              ?

                              /// CHeck Show & Hide.
                              Icons.visibility
                              : Icons.visibility_off,
                        )),
                  ),
                ),

                const SizedBox(height: 30),
                LabelInput(
                  text: 'Ulangi Masukkan Password',
                ),
                //const SizedBox(height: 30),
                TextFormField(
                  obscureText: _isHiddenKonfirmasi,
                  controller: _passwordKonfirmasi,
                  validator: validatePwdKonfirmasi,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(fontSize: 15),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 15),
                    /* border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ), */
                    hintText: "",
                    prefixIcon: Icon(Icons.lock_rounded),
                    suffix: InkWell(
                        onTap: _togglePasswordViewKonfirmasi,
                        child: Icon(
                          _isHiddenKonfirmasi
                              ?

                              /// CHeck Show & Hide.
                              Icons.visibility
                              : Icons.visibility_off,
                        )),
                  ),
                ),
                const SizedBox(height: 30),
                //ALAMAT
                LabelInput(
                  text: 'Alamat',
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
                const SizedBox(height: 30),

                //PROPINSI===================
                LabelInput(
                  text: 'Propinsi',
                ),
                //TERLALU START
                //const SizedBox(height: 5),
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
                const SizedBox(height: 30),
                //SELESAI
                //const SizedBox(height: 5),
                LabelInput(
                  text: 'Kota',
                ),

                DropdownButtonFormField(

                    //color: Color.fromARGB(255, 195, 0, 110),
                    //style: TextStyle(fontSize: 15),
                    //value: kotaku,
                    hint: Text('Kota'),
                    value: (kotaTemp.isEmpty ? 0 : kotaTemp[0]["id"]),
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
                //ALAMAT
                LabelInput(
                  text: 'Telp/HP',
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
                LabelInput(
                  text: 'Email',
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
                const SizedBox(height: 30),
                //=====save button
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
                      //bool sam = _formkey.currentState!.validate();
                      //log(sam.toString());
                      //cek hp di database
                      //log(_cekHP(_telp.text).toString());

                      //log(_formkey.currentState!.validate().toString());
                      //log('telepon blm ada di dbase');
                      //============================================
                      //if (_formkey.currentState!.validate()) {
                      if (_formkey.currentState!.validate()) {
                        if (_cekHP(_telp.text) == true ||
                            _cekEmail(_email.text) == true) {
                          //log('telepon /email sdh ada di dbase');
                          LibClass.popAlert(context, 'Cek ulang data anda',
                              'No Telp/HP yang anda masukkan sudah pernah dipakai');
//muali
                        } else {
                          pemilikBox.put(Pemilik(
                            //id: 0,
                            namapemilik: _namapemilik.text,
                            password: _password.text,
                            alamat: _alamat.text,
                            kota: kotaku,
                            propinsi: propinsiku,
                            hp: _telp.text,
                            email: _email.text,
                          ));
                          //bool insertedPemilik = true;

                          _popupSave();

                          // _popupSaveError();
                        }
                      } else {
                        LibClass.popAlert(context, 'Cek ulang data anda',
                            'data blm valid/lengkap');
                      }
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
    );
  }

  void _popAlert5(String ttl, String subttl) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            shadowColor: Colors.black,
            backgroundColor: Color.fromARGB(131, 86, 86, 86),
            //alignment: Alignment.center,
            title: Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              alignment: Alignment.center,
              /* decoration: BoxDecoration(
                  color: Color(0xffeae3c3),
                  borderRadius: BorderRadius.circular(10)), */
              //color: Color(0xffc94b4b),
              child: Column(
                children: [
                  Text(
                    ttl,
                    //'Cek ulang data anda',
                    style: TextStyle(
                      fontSize: 25,
                      //fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            content: Container(
              child: Text(
                //'No Telp/HP yang anda masukkan sudah pernah dipakai',
                subttl,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
            actions: [
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                      alignment: Alignment.center,
                      fixedSize: Size(100, 50),
                      backgroundColor: Color(0xffc94b4b)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        //fontWeight: FontWeight.bold,
                      )),
                ),
              )
            ],
          );
        });
  }

  void _popupSave() {
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

  //============================
  void _popupSaveError() {
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(milliseconds: 1100), () {});

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
                  'Ada kesalahan',
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
