import 'package:flutter/material.dart';
import 'package:biydaal/screen/settings.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Тохиргоо",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            buildItem(Icons.ac_unit, "Хэмжлийн нэгж"),
            buildItem(Icons.calculate, "Тооцоолол"),
            buildItem(Icons.brightness_4, "Загвар"),
            buildItem(Icons.import_export, "Өгөгдөл экспорт / импорт"),
            buildItem(Icons.description, "Анхааруулга"),
            buildItem(Icons.bug_report, "Алдаа мэдээлэх"),
            buildItem(Icons.privacy_tip, "Нууцлал"),
            buildItem(Icons.info_outline, "Аппын тухай"),

            const Spacer(),

            // App logo bottom
            Column(
              children: const [
                Icon(Icons.radar, color: Colors.green, size: 60),
                SizedBox(height: 10),
                Text(
                  "OpenNutriTracker",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text("Хувилбар 1.0.0",
                    style: TextStyle(color: Colors.grey)),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          Icon(icon, size: 26, color: Colors.black87),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
