//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:kos/daftar_property.dart';
//import 'package:flutter/widgets.dart';
import 'package:kos/dashboard.dart';
import 'package:kos/entities/kos.dart';
import 'package:kos/objectbox.g.dart';
import 'package:kos/penghuni_add.dart';
import 'package:kos/tagihan.dart';
import 'package:kos/main.dart';
//import 'package:kos/objectbox.g.dart';
//import 'package:kos/entities/objectbox.dart';

// ignore: prefer_typing_uninitialized_variables
class MyGlobalVariables {
  static int userId = -1;
  static String userName = '';
  static String userEmail = '';
  static String userHp = '';
  static String alamat = '';
  static int kota = -1;
  static int propinsi = -1;

  /* 
  MyGlobalVariables.userId
  MyGlobalVariables.userName 
  MyGlobalVariables.userEmail 
  MyGlobalVariables.userHp 
  MyGlobalVariables.alamat 
  MyGlobalVariables.kota
  MyGlobalVariables.propinsi 
  */
}

class ButtonSimpan extends StatelessWidget {
  //final VoidCallback fncParam;
  const ButtonSimpan(
      {super.key,
      this.pgTujuan,
      this.ownerKos,
      this.subTitleDialog,
      this.titleDialog,
      this.txtButton});

  final ownerKos;
  final pgTujuan;
  final String? txtButton;
  final String? titleDialog;
  final String? subTitleDialog;
  //const ButtonSimpan({required this.fncParam});
  //const AppBarForm({super.key, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Center(
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
          showDialog(
              context: context,
              builder: (context) {
                Future.delayed(Duration(milliseconds: 1100), () {
                  //Navigator.of(context).pop(true);
                  //==============================coba tambahan SchedulerBinding.instance.addPostFrameCallback((_) {
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    // add your code here.
                    LibClass.chPageCommon(pgTujuan, context);
                  });
                  //==============================
                });
                return AlertDialog(
                  alignment: Alignment.center,
                  title: Center(
                    //Title dialog
                    child: (titleDialog is String
                        ? Text(titleDialog.toString(),
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold))
                        : Text(
                            'Simpan Data',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          )),
                  ),
                  //subtitle dialog
                  content: SizedBox(
                    height: 40,
                    child: Center(
                      child: (subTitleDialog is String
                          ? Text(
                              subTitleDialog.toString(),
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                          : Text(
                              'Data berhasil disimpan...',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )),
                    ),
                  ),
                );
              });

          /*  showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                    title: Text('Simpan Data User'),
                    content: Text('Data berhasil disimpan...'),
                    // return const AlertDialog(
                    //   title: Text('Exiting Build Up Domino...')
                    // );
                  ));
          Future.delayed(const Duration(seconds: 3), () {
            //Navigator.of(context).pop(true);
            //LibClass.chPageCommon(pgTujuan, context, ownerKos);

            LibClass.chPageCommon(context, ownerKos, pgTujuan);
          }); */
        },
        child: (txtButton is String
            ? Text(
                txtButton.toString(),
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )
            : Text(
                'S I M P A N',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )),
      ),
    );
    //);
  }
}

class AppBarForm extends StatelessWidget implements PreferredSizeWidget {
  const AppBarForm({super.key, this.title, this.subtitle, this.backpage});

  //final Widget? title;
  final String? title;
  final String? subtitle;
  final backpage;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            /* Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                //return Dashboard(jeneng: widget.namausr);
                //return halTujuan[index];
                return backpage;
              }),
            ); */
          }),
      //title: (title is Widget ? title : Text('yongkru')),
      //title: (title is String ? Text(title.toString()) : Text('Kosku')),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (title is String
              ? Text(
                  title.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                )
              : Text('Kosku',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                      fontWeight: FontWeight.bold))),
          (subtitle is String
              ? Text(
                  subtitle.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )
              : Text('Aplikasi Manajemen Kos Terbaik',
                  style: TextStyle(color: Colors.white70, fontSize: 15))),
        ],
      ),

      /* Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            appBarTitle,
            style: TextStyle(fontSize: 16),
          )
        ],
      ), */
      shadowColor: Colors.black,
      elevation: 10,
      centerTitle: true,
      backgroundColor: Color(0xffc94b4b),
      foregroundColor: Colors.white,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}

// TODO: implement createElement

class BotNaviBar extends StatefulWidget {
  final int parcurrentIndex;

  //const BotNaviBar({Key? key, required this.ownerKos, this.colour}) : super(key: key);
  BotNaviBar({this.colour, required this.parcurrentIndex});
  final Color? colour;
  //final int?parcurrentIndex;

  @override
  State<BotNaviBar> createState() => _BotNaviBarState();
}

class _BotNaviBarState extends State<BotNaviBar> {
  //int nonNullableInt = widget.parcurrentIndex ?? 0;
  //int nonNullableInt = widget.parcurrentIndex ?? 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.parcurrentIndex,
      //(widget.parcurrentIndex int ? widget.parcurrentIndex : 1),
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.white60,
      selectedItemColor: Colors.white,
      //backgroundColor: Color(0xff9bb6a1),
      //Color(0xff9bb6a1)
      backgroundColor:
          (widget.colour is Color ? widget.colour : Color(0xff9bb6a1)),
      iconSize: 35,
      onTap: (index) => setState(
        () => LibClass.chPage(context, index),
      ),
      items: const [
        BottomNavigationBarItem(
            backgroundColor: Colors.amber,
            icon: SizedBox(
                width: 10, height: 10, child: Icon(Icons.home, size: 25)),
            label: ''),
        BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: SizedBox(
                width: 10,
                height: 10,
                child: Icon(
                  Icons.notifications,
                  size: 25,
                )),
            label: ''),
      ],
    );
  }
}

class floatBtn extends StatelessWidget {
  final pgTujuan;
  const floatBtn({super.key, this.pgTujuan});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Icon(Icons.add),
        onPressed: () {
//POPUP
          LibClass.chPageCommon(context, pgTujuan);
          /* showDialog(
              context: context,
              builder: (BuildContext context) {
                return PenghuniAdd(
                  namaOwner: ownerKos,
                  idProperti: "1",
                );
              }); */
          //END OF POPUP
        });
  }
}

class LabelInput extends StatelessWidget {
  final String text;

  LabelInput({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
    );
  }
}

class LibClass {
  Box<Pemilik> pemilikBox = store.box<Pemilik>();

  static void popAlert(context, String ttl, String subttl) {
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

  static void chPage(context, index) {
    final halTujuan = [Dashboard(), tagihan()];
    //setState(() => currentIndex = index);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return halTujuan[index];
      }),
    );
  }

  static void chPageCommon(pgTujuan, context) {
    //final halTujuan = [Dashboard(jeneng: ownerKos), tagihan()];
    //setState(() => currentIndex = index);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return pgTujuan;
      }),
    );
  }

  //=============================================
  static void popupSaveLib(ctext, String titl, String subtitl, pgtujuan) {
    showDialog(
        context: ctext,
        builder: (ctext) {
          Future.delayed(Duration(milliseconds: 1100), () {
             /* Navigator.pushReplacement(
              ctext,
              MaterialPageRoute(builder: (ctext) {
                return pgtujuan;
              }),
            ); */
            Navigator.of(ctext).pop();
            
          });

          //===showalert
          return AlertDialog(
            alignment: Alignment.center,
            title: Center(
              child: Text(
                titl,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            content: SizedBox(
              height: 40,
              child: Center(
                child: Text(
                  subtitl,
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
  //================================================
}
