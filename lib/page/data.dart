import 'package:flutter/material.dart';

class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);

  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  double inputValue = 0;
  double byteValue = 0;
  double kilobyteValue = 0;
  double megabyteValue = 0;
  double gigabyteValue = 0;
  double terabyteValue = 0;
  double petabyteValue = 0;

  void convertData() {
    byteValue = inputValue;
    kilobyteValue = byteValue / 1024;
    megabyteValue = kilobyteValue / 1024;
    gigabyteValue = megabyteValue / 1024;
    terabyteValue = gigabyteValue / 1024;
    petabyteValue = terabyteValue / 1024;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Jumlah dalam Byte'),
              onChanged: (value) {
                inputValue = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertData,
              child: Text('Konversi'),
            ),
            SizedBox(height: 20),
            Text('Hasil Konversi:'),
            Text('Byte: $byteValue'),
            Text('Kilobyte: $kilobyteValue'),
            Text('Megabyte: $megabyteValue'),
            Text('Gigabyte: $gigabyteValue'),
            Text('Terabyte: $terabyteValue'),
            Text('Petabyte: $petabyteValue'),
          ],
        ),
      ),
    );
  }
}
