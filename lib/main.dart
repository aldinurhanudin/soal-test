import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Form Zodiac'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nama',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _dobController,
              decoration:
                  InputDecoration(labelText: 'Tanggal Lahir (yyyy-mm-dd)'),
            ),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green)),
                onPressed: () {
                  _handleSubmit();
                },
                child: Text('Submit'),
              ),
            ),
            SizedBox(height: 16.0),
            Text(_result),
          ],
        ),
      ),
    );
  }

  void _handleSubmit() {
    String name = _nameController.text;
    String dob = _dobController.text;

    if (name.isNotEmpty && dob.isNotEmpty) {
      // Hitung usia
      DateTime birthDate = DateTime.parse(dob);
      DateTime currentDate = DateTime.now();
      Duration difference = currentDate.difference(birthDate);
      int years = difference.inDays ~/ 365;
      int months = (difference.inDays % 365) ~/ 30;
      int days = (difference.inDays % 365) % 30;

      // Dapatkan Zodiac Name
      String zodiacName = getZodiacName(birthDate.month, birthDate.day);

      // Tampilkan hasil
      setState(() {
        _result = '''
          Hallo $name,
          Usia anda saat ini adalah:
          $years Tahun,
          $months Bulan,
          $days Hari
          Bintang anda adalah $zodiacName
        ''';
      });
    }
  }

  String getZodiacName(int month, int day) {
    if ((month == 12 && day >= 22 && day <= 31) ||
        (month == 1 && day >= 1 && day <= 20)) {
      return 'Capricorn';
    } else if ((month == 1 && day >= 21 && day <= 31) ||
        (month == 2 && day >= 1 && day <= 19)) {
      return 'Aquarius';
    } else if ((month == 3 && day >= 1 && day <= 20) ||
        (month == 4 && day >= 1 && day <= 20)) {
      return 'Aries';
    } else if ((month == 4 && day >= 21 && day <= 30) ||
        (month == 5 && day >= 1 && day <= 20)) {
      return 'Taurus';
    } else if ((month == 5 && day >= 21 && day <= 31) ||
        (month == 6 && day >= 1 && day <= 20)) {
      return 'Gemini';
    } else if ((month == 6 && day >= 21 && day <= 30) ||
        (month == 7 && day >= 1 && day <= 22)) {
      return 'Cancer';
    } else if ((month == 7 && day >= 23 && day <= 31) ||
        (month == 8 && day >= 1 && day <= 22)) {
      return 'Leo';
    } else if ((month == 8 && day >= 23 && day <= 31) ||
        (month == 9 && day >= 1 && day <= 22)) {
      return 'Virgo';
    } else if ((month == 9 && day >= 23 && day <= 30) ||
        (month == 10 && day >= 1 && day <= 22)) {
      return 'Libra';
    } else if ((month == 10 && day >= 23 && day <= 31) ||
        (month == 11 && day >= 1 && day <= 21)) {
      return 'Scorpio';
    } else {
      return 'Sagittarius';
    }
  }
}
