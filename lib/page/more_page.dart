import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:utspemob/page/b_m_i.dart';
import 'package:utspemob/page/data.dart';
import 'package:utspemob/page/home_page.dart';
import 'package:utspemob/page/index_nilai.dart';
import 'package:utspemob/page/konversi_mata_uang.dart';
import 'package:utspemob/page/konversi_suhu.dart';
import 'package:utspemob/page/mass.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('More Calculator'),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 1,
            selectedItemColor: Colors.deepPurple,
            onTap: (value) {
              if (value == 0) {
                context.goNamed('kalkulator');
              } else if (value == 1) {
                context.goNamed('more');
              } else if (value == 2) {
                context.goNamed('profile');
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.calculate),
                label: 'Kalkulator',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.apps),
                label: 'More',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ]),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffB81736),
                Color(0xff281537),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: <Widget>[
                Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KalkulatorScreen()),
                      );
                    },
                    leading: Icon(
                      Icons.calculate,
                      size: 50,
                    ),
                    title: Text('Kalkulator'),
                    subtitle: Text('Here is a second line'),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Data()),
                      );
                    },
                    leading: Icon(
                      Icons.data_exploration_outlined,
                      size: 50,
                    ),
                    title: Text('Data'),
                    subtitle: Text('Here is a second line'),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Mass()),
                      );
                    },
                    leading: Icon(
                      Icons.line_weight,
                      size: 50,
                    ),
                    title: Text('Mass'),
                    subtitle: Text('Here is a second line'),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const KonversiMataUang()),
                      );
                    },
                    leading: Icon(
                      Icons.money,
                      size: 50,
                    ),
                    title: Text('Konversi Mata Uang'),
                    subtitle: Text('Here is a second line'),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const KonversiSuhu()),
                      );
                    },
                    leading: Icon(
                      Icons.sunny_snowing,
                      size: 50,
                    ),
                    title: Text('Konversi Suhu'),
                    subtitle: Text('Here is a second line'),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BMI()),
                      );
                    },
                    leading: Icon(
                      Icons.accessibility,
                      size: 50,
                    ),
                    title: Text('Hitung BMI'),
                    subtitle: Text('Here is a second line'),
                  ),
                ),
                Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const IndexNilai()),
                      );
                    },
                    leading: Icon(
                      Icons.grade,
                      size: 50,
                    ),
                    title: Text('Index Nilai'),
                    subtitle: Text('Here is a second line'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
