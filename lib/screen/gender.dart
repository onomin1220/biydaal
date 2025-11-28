import 'package:flutter/material.dart';
import 'activity.dart';

class GenderAgeScreen extends StatefulWidget {
  const GenderAgeScreen({super.key});

  @override
  State<GenderAgeScreen> createState() => _GenderAgeScreenState();
}

class _GenderAgeScreenState extends State<GenderAgeScreen> {
  String? selectedGender;
  DateTime? birthday;

  Future<void> pickBirthday() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 18),
      firstDate: DateTime(1950),
      lastDate: now,
    );

    if (picked != null) {
      setState(() => birthday = picked);
    }
  }

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
            const Text("Хүйс", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text("Таны хүйс юу вэ?", style: TextStyle(color: Colors.black54)),
            const SizedBox(height: 20),

            // male
            GestureDetector(
              onTap: () => setState(() => selectedGender = "male"),
              child: buildGenderButton("эрэгтэй", selectedGender == "male"),
            ),
            const SizedBox(height: 12),

            // female
            GestureDetector(
              onTap: () => setState(() => selectedGender = "female"),
              child: buildGenderButton("эмэгтэй", selectedGender == "female"),
            ),

            const SizedBox(height: 40),
            const Text("Нас", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text("Таны төрсөн өдөр хэд вэ?", style: TextStyle(color: Colors.black54)),
            const SizedBox(height: 12),

            GestureDetector(
              onTap: pickBirthday,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green.shade50,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 20),
                    const SizedBox(width: 10),
                    Text(
                      birthday == null
                          ? "Төрсөн өдөр"
                          : "${birthday!.year}-${birthday!.month}-${birthday!.day}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // NEXT
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  if (selectedGender == null) {
                    return showMsg("Хүйс сонгоно уу.");
                  }
                  if (birthday == null) {
                    return showMsg("Төрсөн өдөр сонгоно уу.");
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ActivityScreen(
                        gender: selectedGender!,
                        birthday: birthday!,
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

  void showMsg(String txt) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(txt)));
  }

  Widget buildGenderButton(String label, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: selected ? Colors.green : Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: selected ? Colors.green.withOpacity(0.15) : Colors.white,
      ),
      child: Text(label, style: const TextStyle(fontSize: 18)),
    );
  }
}
