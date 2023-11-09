import 'package:flutter/material.dart';

class Mass extends StatefulWidget {
  const Mass({Key? key}) : super(key: key);

  @override
  _MassState createState() => _MassState();
}

class _MassState extends State<Mass> {
  double gramValue = 0;
  double kilogramValue = 0;
  double onsValue = 0;
  double poundValue = 0;
  double kilopoundValue = 0;

  void convertMass() {
    gramValue = gramValue;
    kilogramValue = gramValue / 1000;
    onsValue = gramValue * 0.03527396;
    poundValue = gramValue * 0.00220462;
    kilopoundValue = poundValue * 0.001;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Massa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Jumlah dalam Gram'),
              onChanged: (value) {
                gramValue = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertMass,
              child: Text('Konversi'),
            ),
            SizedBox(height: 20),
            Text('Hasil Konversi:'),
            Text('Gram: $gramValue g'),
            Text('Kilogram: $kilogramValue kg'),
            Text('Ons: $onsValue ons'),
            Text('Pound: $poundValue lb'),
            Text('Kilopound: $kilopoundValue klb'),
          ],
        ),
      ),
    );
  }
}
