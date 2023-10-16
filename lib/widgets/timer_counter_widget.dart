import 'dart:async';

import 'package:esmabatu/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CountdownWidget extends StatefulWidget {
  const CountdownWidget({super.key});

  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  final controller = Get.find<MainController>();

  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(milliseconds: 1000),
      (Timer t) => controller.calculateRemainingTime(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CountdownCard(label: 'Gün', value: controller.remTimeDays),
        CountdownCard(label: 'Saat', value: controller.remTimeHours),
        CountdownCard(label: 'Dakika', value: controller.remTimeMinutes),
        CountdownCard(label: 'Saniye', value: controller.remTimeSeconds),
      ],
    );
  }
}

class CountdownCard extends StatelessWidget {
  final String label;
  final RxInt value;

  const CountdownCard({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.9),
              blurRadius: 8.0,
            ),
          ],
          color: Colors.grey.withOpacity(0.3),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => Text(
                  value.value.toString(),
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 6.0),
              Text(
                label,
                style: GoogleFonts.quicksand(
                  fontSize: 14.0,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
