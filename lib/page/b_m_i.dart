import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  double weight = 0;
  double height = 0;
  double bmi = 0;

  String getBMIStatus() {
    if (bmi == 0) {
      return 'Belum dihitung';
    } else if (bmi < 18.5) {
      return 'Berat badan kurang';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Berat badan normal';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Berat badan berlebih';
    } else {
      return 'Obesitas';
    }
  }

  void calculateBMI() {
    if (height > 0) {
      // Hitung BMI
      bmi = weight / ((height / 100) * (height / 100));
    } else {
      bmi = 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator BMI'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Berat (kg)'),
                onChanged: (value) {
                  weight = double.tryParse(value) ?? 0;
                },
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Tinggi (cm)'),
                onChanged: (value) {
                  height = double.tryParse(value) ?? 0;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculateBMI,
                child: Text('Hitung BMI'),
              ),
              SizedBox(height: 20),
              Text(
                'BMI: $bmi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Status BMI: ${getBMIStatus()}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
