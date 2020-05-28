import 'dart:math';

import 'package:flutter/material.dart';
import 'widgets/start.dart';
import './widgets/playing.dart';
import './widgets/finished.dart';

void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _widgetSelected = 0;
  int _hunch;
  int min = 0;
  int max = 1001;
  int attempts = 0;
  List<int> allNumbers = [];
  bool hit = true;

  void _changeWidget(int value) {
    setState(() => _widgetSelected = value);
  }

  void _start() {
    _changeWidget(1);
    _random();
  }

  void _restart() {
    _changeWidget(0);
    _hunch = null;
    min = 0;
    max = 1000;
    attempts = 0;
    allNumbers.clear();
    hit = true;
  }

  void _random() {
    int random;

    do {
      random = min + Random().nextInt(max - min);
    } while (allNumbers.contains(random));

    setState(() {
      _hunch = random;
      allNumbers.add(random);
      attempts++;
    });    

    print('min: $min');
    print('max: $max');
    print(allNumbers);
    print('attempts: $attempts');
  }

  void _numberSmaller() {
    if (min == max) {
      setState(() => _widgetSelected = 2);
    } else {
      setState(() => max = _hunch);
      _random();
    }
  }

  void _numberBigger() {
    if (min == max) {
      setState(() => _widgetSelected = 2);
    } else {
      setState(() => min = _hunch);
      _random();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.cyan),

      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Game Advinhação'),
        ),

        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xDD000000),
              Color(0x8A000000),
            ],
          ),
        ),
          child: _widgetSelected == 0
            ? Start(_start)
            : _widgetSelected == 1
              ? Playing(
                restart: _restart,
                hunch: _hunch,
                numberSmaller: _numberSmaller,
                numberBigger: _numberBigger,
                changeWidget: _changeWidget,
              )
              : Finished(restart: _restart, attempts: attempts, hit: hit, number: allNumbers.last),
        )
      ),
    );
  }
}