import 'package:flutter/material.dart';
import 'package:biydaal/screen/profile.dart';
import 'package:biydaal/screen/settings.dart';

class HomeScreen extends StatelessWidget {
  final int calories;
  final int carbs;
  final int fat;
  final int protein;

  const HomeScreen({
    super.key,
    required this.calories,
    required this.carbs,
    required this.fat,
    required this.protein,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F2),

      // ==== BOTTOM NAVIGATION ====
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // HOME (Static)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.home, color: Colors.green),
                Text("Нүүр",
                    style: TextStyle(color: Colors.green, fontSize: 12)),
              ],
            ),

            // DIARY (Static for now)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.bookmark_border, color: Colors.black54),
                Text("Тэмдэглэл",
                    style: TextStyle(color: Colors.black54, fontSize: 12)),
              ],
            ),

            // PROFILE (CLICKABLE)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                      activity: "Low Active",
                      goal: "Lose Weight",
                      weight: 55,
                      height: 150,
                      age: 20,
                      gender: "female",
                    ),
                  ),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.person_outline, color: Colors.black54),
                  Text("Профайл",
                      style: TextStyle(color: Colors.black54, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== HEADER =====
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.radar, size: 40, color: Colors.green),
                      SizedBox(width: 10),
                      Text(
                        "Nozu Tracker",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  // SETTINGS ICON (CLICKABLE)
                  IconButton(
                    icon: const Icon(Icons.settings, size: 28),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ===== CALORIE SUMMARY CARD =====
              buildCalorieCard(),

              const SizedBox(height: 30),

              // ===== ACTIVITY =====
              const Text("Үйл ажиллагаа",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600)),
              const SizedBox(height: 12),
              buildAddCard(),

              const SizedBox(height: 30),

              // ===== BREAKFAST =====
              const Text("Өглөөний цай",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600)),
              const SizedBox(height: 12),
              buildAddCard(),

              const SizedBox(height: 30),

              // ===== LUNCH =====
              const Text("Өдрийн хоол",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600)),
              const SizedBox(height: 12),
              buildAddCard(),

              const SizedBox(height: 30),

              // ===== DINNER =====
              const Text("Оройн хоол",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600)),
              const SizedBox(height: 12),
              buildAddCard(),
            ],
          ),
        ),
      ),

      // ===== FLOATING ADD BUTTON =====
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }

  // ---------- CARD COMPONENTS ----------

  Widget buildCalorieCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        children: [
          Text(
            "$calories",
            style: const TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const Text(
            "өдөрт авах калорын хэмжээ",
            style: TextStyle(color: Colors.black45, fontSize: 16),
          ),

          const SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              macroIndicator("Нүүрс ус", carbs),
              macroIndicator("Өөх тос", fat),
              macroIndicator("Уураг", protein),
            ],
          ),
        ],
      ),
    );
  }

  Widget macroIndicator(String label, int grams) {
    return Column(
      children: [
        Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.green, width: 3),
          ),
        ),
        const SizedBox(height: 6),
        Text("0/$grams грамм", style: const TextStyle(fontSize: 14)),
        Text(label,
            style: const TextStyle(fontSize: 12, color: Colors.black45)),
      ],
    );
  }

  Widget buildAddCard() {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: const Center(
        child: Icon(Icons.add, size: 38, color: Colors.black54),
      ),
    );
  }
}
