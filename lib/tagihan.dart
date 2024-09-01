import 'package:flutter/material.dart';
import 'package:kos/dashboard.dart';

class tagihan extends StatefulWidget {
  const tagihan({super.key});
  @override
  State<tagihan> createState() => _tagihanState();
}

class _tagihanState extends State<tagihan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tagihan")),
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
    );
  }
}
