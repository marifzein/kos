import 'package:flutter/material.dart';
import 'package:kos/dashboard.dart';

void main() {
  runApp(pembayaran());
}

class pembayaran extends StatelessWidget {
  const pembayaran({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Elevation'),
          elevation: 20,
        ),
        body: Center(
          child: Text(' Elevation 20'),
        ),
      ),
    );
  }
}

class pembayaran1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pembayaran"),
          elevation: 10,
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: ElevatedButton(
            child: Text("Dashboard"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Dashboard();
              }));
            },
          ),
        ),
      ),
    );
  }
}
