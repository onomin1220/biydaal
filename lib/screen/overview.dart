import 'package:flutter/material.dart';
import 'package:biydaal/screen/home.dart';


class OverviewScreen extends StatelessWidget {
  final String gender;
  final DateTime birthday;
  final String activity;
  final String goal;

  const OverviewScreen({
    super.key,
    required this.gender,
    required this.birthday,
    required this.activity,
    required this.goal,
  });

  // --- 1. Калори тооцоолох ---
  int calculateCalories() {
    int base = 1700;

    if (activity == "Идвэхтэй 50%") base += 150;
    if (activity == "Маш их идвэхтэй 75%") base += 300;

    if (goal == "Жин хасах") base -= 200;
    if (goal == "Жин нэмэх") base += 200;

    return base;
  }

  // --- 2. Макро тооцоолох ---
  Map<String, int> calculateMacros(int calories) {
    final carbs = (calories * 0.50 / 4).round();      // 50% / 4 kcal
    final protein = (calories * 0.20 / 4).round();    // 20% / 4 kcal
    final fat = (calories * 0.30 / 9).round();        // 30% / 9 kcal

    return {
      "Нүүрс ус": carbs,
      "Уураг": protein,
      "Өөх тос": fat,
    };
  }

  @override
  Widget build(BuildContext context) {
    final calories = calculateCalories();
    final macros = calculateMacros(calories);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F2),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Text("Таны тойм",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),

            const SizedBox(height: 20),
            const Text("Таны калорын зорилго:",
                style: TextStyle(fontSize: 16, color: Colors.black54)),

            Text(
              "$calories",
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const Text("Өдөрт авах калорын хэмжээ",
                style: TextStyle(fontSize: 16, color: Colors.black45)),

            const SizedBox(height: 40),

            const Text("Таны өдөрт авах макро хэмжээ:",
                style: TextStyle(fontSize: 18, color: Colors.black87)),

            const SizedBox(height: 20),

            // --- CARBS ---
            Text("${macros['Нүүрс ус']} g",
                style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.green)),
            const Text("Нүүрс ус", style: TextStyle(color: Colors.black54)),
            const SizedBox(height: 20),

            // --- FAT ---
            Text("${macros['Өөх тос']} g",
                style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.green)),
            const Text("Өөх тос", style: TextStyle(color: Colors.black54)),
            const SizedBox(height: 20),

            // --- PROTEIN ---
            Text("${macros['Уураг']} g",
                style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.green)),
            const Text("Уураг", style: TextStyle(color: Colors.black54)),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    padding: const EdgeInsets.symmetric(vertical: 18)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(
                        calories: calories,
                        carbs: macros['Нүүрс ус']!,
                        fat: macros['Өөх тос']!,
                        protein: macros['Уураг']!,
                      ),
                    ),
                  );
                },

                child: const Text("Эхлэх",
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
