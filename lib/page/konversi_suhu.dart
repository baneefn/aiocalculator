import 'package:flutter/material.dart';

class KonversiSuhu extends StatefulWidget {
  const KonversiSuhu({Key? key}) : super(key: key);

  @override
  _KonversiSuhuState createState() => _KonversiSuhuState();
}

class _KonversiSuhuState extends State<KonversiSuhu> {
  double inputSuhu = 0;
  double resultSuhu = 0;
  String fromUnit = 'Celsius';
  String toUnit = 'Fahrenheit';

  void convertSuhu() {
    if (fromUnit == 'Celsius' && toUnit == 'Fahrenheit') {
      resultSuhu = (inputSuhu * 9 / 5) + 32;
    } else if (fromUnit == 'Fahrenheit' && toUnit == 'Celsius') {
      resultSuhu = (inputSuhu - 32) * 5 / 9;
    } else if (fromUnit == 'Celsius' && toUnit == 'Kelvin') {
      resultSuhu = inputSuhu + 273.15;
    } else if (fromUnit == 'Kelvin' && toUnit == 'Celsius') {
      resultSuhu = inputSuhu - 273.15;
    } else if (fromUnit == 'Fahrenheit' && toUnit == 'Kelvin') {
      resultSuhu = (inputSuhu - 32) * 5 / 9 + 273.15;
    } else if (fromUnit == 'Kelvin' && toUnit == 'Fahrenheit') {
      resultSuhu = (inputSuhu - 273.15) * 9 / 5 + 32;
    } else if (fromUnit == 'Celsius' && toUnit == 'Reamur') {
      resultSuhu = inputSuhu * 0.8;
    } else if (fromUnit == 'Reamur' && toUnit == 'Celsius') {
      resultSuhu = inputSuhu / 0.8;
    } else {
      // Konversi lainnya
      resultSuhu = inputSuhu; // Untuk satuan yang sama
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Suhu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Suhu'),
              onChanged: (value) {
                inputSuhu = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: fromUnit,
                  items: ['Celsius', 'Fahrenheit', 'Kelvin', 'Reamur']
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    fromUnit = value!;
                    convertSuhu();
                  },
                ),
                Text('ke'),
                DropdownButton<String>(
                  value: toUnit,
                  items: ['Celsius', 'Fahrenheit', 'Kelvin', 'Reamur']
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    toUnit = value!;
                    convertSuhu();
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertSuhu,
              child: Text('Konversi'),
            ),
            SizedBox(height: 20),
            Text(
              'Hasil Konversi: $resultSuhu $toUnit',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
