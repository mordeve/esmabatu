import 'package:esmabatu/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CountdownWidget extends StatelessWidget {
  const CountdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainController>();
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
              blurRadius: 4.0,
              spreadRadius: 2,
              offset: const Offset(0, 2),
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
                  value.value.toString().padLeft(2, '0'),
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
