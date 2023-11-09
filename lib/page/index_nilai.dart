import 'package:flutter/material.dart';

class IndexNilai extends StatefulWidget {
  const IndexNilai({Key? key}) : super(key: key);

  @override
  _IndexNilaiState createState() => _IndexNilaiState();
}

class _IndexNilaiState extends State<IndexNilai> {
  String nilaiHuruf = '';
  double nilaiAngka = 0;

  void calculateIndex() {
    if (nilaiAngka >= 90) {
      nilaiHuruf = 'A+';
    } else if (nilaiAngka >= 85) {
      nilaiHuruf = 'A';
    } else if (nilaiAngka >= 80) {
      nilaiHuruf = 'A-';
    } else if (nilaiAngka >= 75) {
      nilaiHuruf = 'B+';
    } else if (nilaiAngka >= 70) {
      nilaiHuruf = 'B';
    } else if (nilaiAngka >= 65) {
      nilaiHuruf = 'B-';
    } else if (nilaiAngka >= 60) {
      nilaiHuruf = 'C+';
    } else if (nilaiAngka >= 55) {
      nilaiHuruf = 'C';
    } else if (nilaiAngka >= 50) {
      nilaiHuruf = 'C-';
    } else {
      nilaiHuruf = 'F';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Index Nilai'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nilai Angka'),
              onChanged: (value) {
                nilaiAngka = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateIndex,
              child: Text('Hitung Index Nilai'),
            ),
            SizedBox(height: 20),
            Text(
              'Index Nilai: $nilaiHuruf',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
