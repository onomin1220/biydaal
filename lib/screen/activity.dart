import 'package:flutter/material.dart';
import 'goal.dart';

class ActivityScreen extends StatefulWidget {
  final String gender;
  final DateTime birthday;

  const ActivityScreen({
    super.key,
    required this.gender,
    required this.birthday,
  });

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  String? selectedActivity;

  final activities = [
    "Идвэхгүй 0%",
    "Бага идвэхтэй 25%",
    "Идвэхтэй 50%",
    "Маш их идвэхтэй 75%"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F2),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Text("Үйл ажиллагаа", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text("Та хэр идэвхтэй вэ? (Дасгал хийхгүйгээр)",
                style: TextStyle(color: Colors.black54)),
            const SizedBox(height: 20),

            ...activities.map((e) => buildButton(e)).toList(),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedActivity == null
                      ? Colors.grey.shade300
                      : Colors.greenAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  if (selectedActivity == null) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("Үйл ажиллагааны түвшинг сонгоно уу?")));
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GoalScreen(
                        gender: widget.gender,
                        birthday: widget.birthday,
                        activity: selectedActivity!,
                      ),
                    ),
                  );
                },
                child: const Text("ДАРААХ", style: TextStyle(color: Colors.black)),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String label) {
    final selected = selectedActivity == label;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () => setState(() => selectedActivity = label),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(color: selected ? Colors.green : Colors.grey),
            borderRadius: BorderRadius.circular(12),
            color: selected ? Colors.green.withOpacity(0.1) : Colors.white,
          ),
          child: Text(label, style: const TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
