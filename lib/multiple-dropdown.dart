//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/* import 'package:kosku/entities/kosku.dart';
import 'package:kosku/objectbox.g.dart';
import 'package:kosku/entities/objectbox.dart';

 */
void main() {
  runApp(const MultiLevelDropDownExample());
}

class MultiLevelDropDownExample extends StatefulWidget {
  const MultiLevelDropDownExample({Key? key}) : super(key: key);

  @override
  State<MultiLevelDropDownExample> createState() =>
      _MultiLevelDropDownExampleState();
}

class _MultiLevelDropDownExampleState extends State<MultiLevelDropDownExample> {
  final List<String> audiMake = [
    'A3',
    'A4',
  ];
  final List<String> bmwMake = [
    '1 Series',
    '2 Series',
  ];

  String? selectedCardModel;
  String? selectedMake;

  late Map<String, List<String>> dataset = {
    'Audi': audiMake,
    'BMW': bmwMake,
  };

  onCarModelChanged(String? value) {
    //dont change second dropdown if 1st item didnt change
    if (value != selectedCardModel) selectedMake = null;
    setState(() {
      selectedCardModel = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('DROPDOWN'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              Text(
                'Mobil',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 5,
              ),
              DropdownButton<String?>(
                  value: selectedCardModel,
                  items: dataset.keys.map((e) {
                    return DropdownMenuItem<String?>(
                      value: e,
                      child: Text('$e'),
                    );
                  }).toList(),
                  onChanged: onCarModelChanged),
              const SizedBox(
                height: 10,
              ),
              DropdownButton<String?>(
                  value: selectedMake,
                  items: (dataset[selectedCardModel] ?? []).map((e) {
                    return DropdownMenuItem<String?>(
                      value: e,
                      child: Text('$e'),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      selectedMake = val!;
                    });
                  }),
              //
            ],
          ),
        ),
      ),
    );
  }
}
