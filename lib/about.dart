import 'package:flutter/material.dart';
//import 'package:kos/dashboard.dart';

Widget _buildGreyText(int item) {
  //for (int i = 0; i < 20; i++) {
  return Text(
    "kk $item",
    style: const TextStyle(color: Colors.grey, fontSize: 60),
  );
  //}
}

class about extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About")),
      body:
          //OverflowBox(
          SingleChildScrollView(
        //maxWidth: double.infinity,
        //maxHeight: double.infinity,

        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildGreyText(1),
              _buildGreyText(2),
              _buildGreyText(3),
              _buildGreyText(4),
              _buildGreyText(5),
              _buildGreyText(6),
              _buildGreyText(7),
              _buildGreyText(8),
            ],
          ),
        ),
      ),
    );
  }
}
