import 'package:flutter/material.dart';
import 'overview.dart';

class GoalScreen extends StatefulWidget {
  final String gender;
  final DateTime birthday;
  final String activity;

  const GoalScreen({
    super.key,
    required this.gender,
    required this.birthday,
    required this.activity,
  });

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  String? selectedGoal;

  final goals = ["Жин хасах", "Жин барих", "Жин нэмэх"];

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
            const Text("Зорилго", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text("Таны одоогийн жингийн зорилго юу вэ?",
                style: TextStyle(color: Colors.black54)),
            const SizedBox(height: 20),

            ...goals.map((g) => buildGoalButton(g)).toList(),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                    selectedGoal == null ? Colors.grey.shade300 : Colors.greenAccent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
                onPressed: () {
                  if (selectedGoal == null) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("Зорилгоо сонгоно уу?")));
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OverviewScreen(
                        gender: widget.gender,
                        birthday: widget.birthday,
                        activity: widget.activity,
                        goal: selectedGoal!,
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

  Widget buildGoalButton(String label) {
    final selected = selectedGoal == label;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () => setState(() => selectedGoal = label),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(color: selected ? Colors.green : Colors.grey),
            color: selected ? Colors.green.withOpacity(0.15) : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(label, style: const TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
