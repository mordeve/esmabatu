import 'dart:async';

import 'package:esmabatu/utils/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String _time = "";

  String _remainingTime() {
    final now = DateTime.now().millisecondsSinceEpoch;
    final future = DateTime(2023, 11, 11, 19, 0, 0).millisecondsSinceEpoch;
    Duration remaining = Duration(milliseconds: future - now);
    return "${remaining.inDays} gün ${remaining.inHours.remainder(24)} saat ${remaining.inMinutes.remainder(60)} dakika ${remaining.inSeconds.remainder(60)} saniye";
  }

  @override
  void initState() {
    super.initState();
    _time = _remainingTime();
    Timer.periodic(
        const Duration(seconds: 1),
        (Timer t) => setState(() {
              _time = _remainingTime();
            }));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(appName),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              padding: const EdgeInsets.all(12.0),
              alignment: Alignment.center,
              child: Text(
                _time,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          )),
      body: const Center(
        child: Text(
          "Seni Seviyorum...",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
