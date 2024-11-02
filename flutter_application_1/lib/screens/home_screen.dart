import 'package:flutter/material.dart';
import '../widgets/keypad.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isArmed = false;
  final String correctPassword = "1234";
  String enteredPassword = "";
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void armSystem() {
    setState(() {
      isArmed = true;
    });
  }

  void disarmSystem() async {
    final disarmSuccess = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Enter Password to Disarm'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(enteredPassword.replaceAll(RegExp(r'.'), '*')),
                  const SizedBox(height: 10),
                  Keypad(
                    onNumberPressed: (number) {
                      setState(() {
                        enteredPassword += number.toString();
                      });
                    },
                    onClearPressed: () {
                      setState(() {
                        enteredPassword = "";
                      });
                    },
                    onEnterPressed: () {
                      if (enteredPassword == correctPassword) {
                        setState(() {
                        enteredPassword = "";
                      });
                        Navigator.pop(context, true);
                      } else {
                        setState(() {
                          enteredPassword = "";
                        });
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Incorrect password. Try again."),
                        ));
                      }
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Cancel'),
                ),
              ],
            );
          },
        );
      },
    );

    if (disarmSuccess == true) {
      setState(() {
        isArmed = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isArmed)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: armSystem,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(24),
                    ),
                    child: const Column(
                      children: [
                        Icon(Icons.home, size: 40),
                        Text('ARM STAY'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: armSystem,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(24),
                    ),
                    child: const Column(
                      children: [
                        Icon(Icons.directions_run, size: 40),
                        Text('ARM AWAY'),
                      ],
                    ),
                  ),
                ],
              )
            else
              ElevatedButton(
                onPressed: disarmSystem,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text(
                  'DISARM',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            const SizedBox(height: 40),
            Text(
              DateFormat('jm').format(DateTime.now()),
              style: const TextStyle(color: Colors.white, fontSize: 48),
            ),
            const SizedBox(height: 8),
            const Text(
              'Wednesday, January 27',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const Text(
              'Carlsbad, CA',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.wb_sunny, color: Colors.yellow),
                    Text('65°F', style: TextStyle(color: Colors.white)),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.wb_sunny, color: Colors.yellow),
                    Text('68°F', style: TextStyle(color: Colors.white)),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.wb_sunny, color: Colors.yellow),
                    Text('70°F', style: TextStyle(color: Colors.white)),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.wb_sunny, color: Colors.yellow),
                    Text('72°F', style: TextStyle(color: Colors.white)),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.wb_sunny, color: Colors.yellow),
                    Text('66°F', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('SYSTEM INFO AND USAGE'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('SYSTEM SETTINGS'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}