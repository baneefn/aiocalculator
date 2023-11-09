import 'package:flutter/material.dart';

class KonversiMataUang extends StatefulWidget {
  const KonversiMataUang({Key? key}) : super(key: key);

  @override
  _KonversiMataUangState createState() => _KonversiMataUangState();
}

class _KonversiMataUangState extends State<KonversiMataUang> {
  double amount = 0;
  String fromCurrency = 'USD';
  String toCurrency = 'EUR';
  double convertedAmount = 0;

  // Buatlah map faktor konversi untuk masing-masing mata uang
  Map<String, double> conversionRates = {
    'USD': 1.0,
    'EUR': 0.85,
    'GBP': 0.75,
    'JPY': 112.47,
    'IDR': 14200.0,
  };

  void convertCurrency() {
    // Ambil faktor konversi berdasarkan mata uang yang dipilih
    double? conversionRate = conversionRates[fromCurrency];
    // Hitung jumlah yang dikonversi
    convertedAmount = amount * conversionRate!;

    // Setelah konversi selesai, perbarui tampilan
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Mata Uang'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Jumlah'),
              onChanged: (value) {
                amount = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: fromCurrency,
                  items: conversionRates.keys
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    fromCurrency = value!;
                    convertCurrency();
                  },
                ),
                Text('ke'),
                DropdownButton<String>(
                  value: toCurrency,
                  items: conversionRates.keys
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    toCurrency = value!;
                    convertCurrency();
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertCurrency,
              child: Text('Konversi'),
            ),
            SizedBox(height: 20),
            Text(
              'Hasil Konversi: $convertedAmount $toCurrency',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
