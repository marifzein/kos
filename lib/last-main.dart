import 'dart:developer';
import 'dart:io';
//mport 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kos/entities/kos.dart';
import 'package:kos/objectbox.g.dart';
//import 'package:kos/entities/kosku.dart';
import 'package:kos/entities/objectbox.dart';

late Store store;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  store = (await ObjectBox.create()).store;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page KAKeK'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _mikmok = "";
  int propidSelected = 0;
  //var _propor;
  // var kotaTemp;
  //final

  //List<Map<String, String>> kotaTemp = [Kota(id: "1", nama: "New Delhi")];
  final List<Map<String, String>> kotaTemp = [
    {"id": "1", "nama": "New Delhi"},
    {"id": "2", "nama": "Washington, D.C."}
  ];
  void _propInc() {
    setState(() {
      //_propor = propinsiBox.getAll().map((e) => e.nama).toList().toString();
      //kotaTemp = kotaBox.getAll().map((e) => e.nama).toList().toString();
    });
  }

  Future(int val) async {
    return setState(() {
      //log('val = $val sedangkan propidSelected = $propidSelected');
      if (propidSelected != val) {
        //log('Query kalo beda propinsi');
        kotaTemp.clear();
        QueryBuilder<Kota> builder =
            kotaBox.query(Kota_.idPropinsi.equals(val is int ? val : 1));

        Query<Kota> query = builder.build();

        var blung = query.find();

        log((blung.length).toString());
        if (blung.length > 0) {
          log('insert array');
          for (int i = 0; i < blung.length; i++) {
            kotaTemp
                .add({'id': (blung[i].id).toString(), 'nama': blung[i].nama});
          }
          log('selesai insert array maseehh');
          //map.blung((e)=>e.nama).toList();
          //_mikmok = _mikmok + blung.toString();
        }
      }
      propidSelected = val;
    });
  }

  void _tampilkotalama(int val) {
    log('val =' + val.toString());
    log('propidselect =' + propidSelected.toString());

    //debugPrint(val.toString());
    //int temp;
    //log('pesan boss');
    //log(val.toString());
    //log((val is int).toString());
    return setState(() {
      if (propidSelected != val) {
        kotaTemp.clear();
        propidSelected = val;
        QueryBuilder<Kota> builder =
            //kotaBox.query(Kota_.idPropinsi.equals(val!));
            kotaBox.query(Kota_.idPropinsi.equals(val is int ? val : 1));
        Query<Kota> query = builder.build();
        //kotaTemp.clear();
        //log('sblm loop');
        //exitCode;

        var blung = query.find();
        //query.find().length > 0 &&

        for (int i = 0; i < 5; i++) {
          kotaTemp.add({'id': (blung[i].id).toString(), 'nama': blung[i].nama});
          //= _mikmok + blung[i].id.toString() + ' ' + blung[i].nama;
        }
      }

      /* _mikmok = "";
      if (query.find().length > 0) {
        for (int i = 0; i < query.find().length; i++) {
          _mikmok = _mikmok + blung[i].id.toString() + ' ' + blung[i].nama;
        }
      } */

      //log(blung.toString());
      //kotaTemp.setAll(0, blung.toList());
      //kotaTemp.map((e)=>e.nama=)
      //kotaTemp = blung;
      //kotaBox.getAll().map((e) => e.nama).toList().toString();
      //for (var element in query.find()) {
      /* for (int i = 0; i < 10; i++) {
        // log('${element.id}-${element.idPropinsi}-${element.nama}');
        /* kotaTemp[i]["id"] = (element.id).toString();
                      
                      kotaTemp.[i]["nama"]=element.nama; */
        //kotaTemp.insert( )
        //i++;
        log((blung[i].nama).toString());
        //kotaTemp.add({'id': (element.id).toString(), 'nama': element.nama});
      } */
      //log((kotaTemp).toString());
      //print((kotaTemp).toString());
    });
  }

  void _tampilkota2(int val) {
    //int temp;
    // log('pesan boss');
    //log(val.toString());
    //log((val is int).toString());
    return setState(() {
      QueryBuilder<Kota> builder =
          //kotaBox.query(Kota_.idPropinsi.equals(val!));
          kotaBox.query(Kota_.idPropinsi.equals(val is int ? val : 1));
      Query<Kota> query = builder.build();

      _mikmok = query.find().toString();
      //kotaTemp.clear();
      /* log('sblm loop');
      for (var element in query.find()) {
        log('${element.id}-${element.idPropinsi}-${element.nama}');
        /* kotaTemp[i]["id"] = (element.id).toString();
                      
                      kotaTemp.[i]["nama"]=element.nama; */
        //kotaTemp.insert( )
        //i++;
        kotaTemp.add({'id': (element.id).toString(), 'nama': element.nama});
      }
      log((kotaTemp).toString()); */
      //print((kotaTemp).toString());
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _mikmok = _mikmok + (kotaBox.getAll()).toString();
      _counter++;
    });
  }

  @override
  final Box<Propinsi> propinsiBox = store.box<Propinsi>();
  final Box<Kota> kotaBox = store.box<Kota>();
  // final propor = store.box<Propinsi>().getAll();

  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter || $_mikmok',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            //combobox============================
            DropdownButtonFormField(
                hint: Text('Propinsi'),

                //focusColor: Color(0xffc94b4b),
                dropdownColor: Color.fromARGB(255, 245, 245, 245),
                icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                isExpanded: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.location_solid),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
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
                onChanged: (val) {
                  //_tampilkota(val!);
                  //_incrementCounter();
                }),

            //end of combobox=====================

            //coba popup
            ListTile(
              title: Text('Kakaaak'),
              trailing: PopupMenuButton(
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text('satu'),
                          value: 1,
                        ),
                        PopupMenuItem(
                          child: Text('dua'),
                          value: 2,
                        )
                      ],
                  onSelected: (val) {}
                  /* (val){
                  setState(() {
                    title=val;
                  });
                }, */
                  ),
            ),

            //end ofcoba pop up

            // combo kota================
            DropdownButtonFormField(

                //color: Color.fromARGB(255, 195, 0, 110),
                //style: TextStyle(fontSize: 15),
                //value: kotaku,
                hint: Text('Kota'),
                dropdownColor: Color.fromARGB(255, 245, 245, 245),
                icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                isExpanded: true,
                decoration: const InputDecoration(
                  //filled: true,
                  //fillColor: Colors.black87,
                  prefixIcon: Icon(CupertinoIcons.location),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                //borderRadius: BorderRadius.all(Radius.circular(10.0)),
                /*  items: kotaBox
                      .getAll() */
                //items: _kotalist
                items: kotaTemp
                    .map((e) => DropdownMenuItem(
                          /* child: Text(e.toString()),
                          value: e, */
                          /* value: e,
                          child: Text(e.values.toString()), */
                          value: e,
                          child: Text(e.toString()),
                        ))
                    .toList(),
                onChanged: (val) {
                  //log('isi propinsi $propinsiBox.length');
                  /*  setState(() {
                      kotaku = val.toString();
                    }); */
                }),

            //end of combo kota==========
            /* SingleChildScrollView(
              child: Container(
                color: Colors.black12,
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$kotaTemp',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ), */
            const SizedBox(height: 5),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Tampilkan',
        child: const Icon(Icons.add),
      ),
      /* floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), / */ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/* class MenuItems{
static const List<MenuItem> itemFirst=[itemSetting,itemShare];

} */
