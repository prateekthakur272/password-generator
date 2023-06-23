import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_genrator/password.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool includeAlphabetSmall = false;
  bool includeAlphabetCapital = false;
  bool includeDigits = false;
  bool includeSymbols = false;

  int length = 8;

  String password = 'Pa&&wor\$';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Password Genrator"),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const Icon(
              Icons.password,
              size: 120,
            ),
            CheckboxListTile(
              title: const Text('Include Alphabet (Small)'),
              value: includeAlphabetSmall,
              onChanged: (value) {
                setState(() {
                  includeAlphabetSmall = value == true;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Include Alphabet (Capital)'),
              value: includeAlphabetCapital,
              onChanged: (value) {
                setState(() {
                  includeAlphabetCapital = value == true;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Include Digits'),
              value: includeDigits,
              onChanged: (value) {
                setState(() {
                  includeDigits = value == true;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Include Symbols'),
              value: includeSymbols,
              onChanged: (value) {
                setState(() {
                  includeSymbols = value == true;
                });
              },
            ),
            Slider(
                max: 24,
                min: 8,
                value: length.toDouble(),
                onChanged: (v) {
                  setState(() {
                    length = v.toInt();
                  });
                }),
            Text(
              'Length ${length.toString()} characters',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: [includeAlphabetCapital, includeAlphabetSmall]
                        .any((element) => element)
                    ? () {
                        setState(() {
                          password = Password(length).genrate(
                              includeAlphabetSmall: includeAlphabetSmall,
                              includeAlphabetCapital: includeAlphabetCapital,
                              includeDigits: includeDigits,
                              includeSymbols: includeSymbols);
                        });
                      }
                    : null,
                child: const Text('Genrate')),
            const SizedBox(
              height: 16,
            ),
            TextButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: password)).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Copied to clipboard'),
                    backgroundColor: Colors.green.shade400,
                  ));
                });
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                padding: const EdgeInsets.all(24),
                backgroundColor: Colors.grey.shade200,
              ),
              child: Text(password),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Click on password to copy to clipboard',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
