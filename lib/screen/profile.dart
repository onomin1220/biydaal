import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String activity;
  final String goal;
  final int weight;
  final int height;
  final int age;
  final String gender;

  const ProfileScreen({
    super.key,
    required this.activity,
    required this.goal,
    required this.weight,
    required this.height,
    required this.age,
    required this.gender,
  });

  double getBMI() {
    return weight / ((height / 100) * (height / 100));
  }

  @override
  Widget build(BuildContext context) {
    final bmi = getBMI();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Хувийн мэдээлэл",
            style: TextStyle(color: Colors.black, fontSize: 22)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // BMI Circle
            Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Colors.greenAccent.withOpacity(.4),
                shape: BoxShape.circle,
              ),
              child: Column(
                children: [
                  Text(
                    bmi.toStringAsFixed(1),
                    style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  const Text("БМИ",
                      style: TextStyle(fontSize: 16, color: Colors.black54)),
                ],
              ),
            ),

            const SizedBox(height: 12),
            const Text(
              "Хэвийн жин",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87),
            ),
            const Text(
              "Эрүүл мэндийн эрсдэл: Дундаж",
              style: TextStyle(color: Colors.black54),
            ),

            const SizedBox(height: 40),

            // INFO LIST
            buildInfo(Icons.directions_walk, "Өдөр тутмын идэвх", activity),
            buildInfo(Icons.flag, "Жингийн зорилго", goal),
            buildInfo(Icons.monitor_weight, "Жин", "$weight кг"),
            buildInfo(Icons.height, "Өндөр", "$height см"),
            buildInfo(Icons.cake, "Нас", "$age жил"),
            buildInfo(Icons.female, "Хүйс", gender == "female" ? "эмэгтэй" : "эрэгтэй"),

            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget buildInfo(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.black87),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              Text(value, style: const TextStyle(color: Colors.black54)),
            ],
          ),
        ],
      ),
    );
  }
}
