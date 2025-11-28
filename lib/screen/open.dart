import 'package:flutter/material.dart';
import 'package:biydaal/screen/gender.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool privacyAccepted = false;
  bool analyticsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F2),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),

            const Text(
              "Тавтай морилно уу",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            Icon(
              Icons.radio_button_checked,
              size: 100,
              color: Colors.green.shade400,
            ),

            const SizedBox(height: 10),

            const Text(
              "Nozu Tracker",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),

            const Text(
              "Version 1.0.0",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 30),

            const Text(
              "NozuTracker нь үнэгүй, нээлттэй эхтэй илчлэг "
                  "ба шим тэжээлийн хяналтын апп бөгөөд таны хувийн "
                  "мэдээллийг хамгаалахыг эрхэмлэдэг.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            const Text(
              "Эхлэхийн тулд таны өдөр тутмын илчлэгийн зорилтыг "
                  "тооцоолоход шаардлагатай мэдээллийг авах хэрэгтэй.\n"
                  "Таны бүх мэдээлэл зөвхөн таны төхөөрөмж дээр "
                  "аюулгүй хадгалагдана.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            // Checkbox 1
            Row(
              children: [
                Checkbox(
                  value: privacyAccepted,
                  onChanged: (v) {
                    setState(() {
                      privacyAccepted = v ?? false;
                    });
                  },
                ),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Би нууцлалын бодлоготой танилцаж, зөвшөөрч байна."),
                      SizedBox(height: 4),
                      Text(
                        "Нууцлалын бодлого",
                        style: TextStyle(
                          color: Colors.green,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Checkbox 2
            Row(
              children: [
                Checkbox(
                  value: analyticsAccepted,
                  onChanged: (v) {
                    setState(() {
                      analyticsAccepted = v ?? false;
                    });
                  },
                ),
                const Expanded(
                  child: Text(
                    "Хөгжүүлэлтийг дэмжих зорилгоор нэргүй ашиглалтын "
                        "мэдээлэл илгээхийг зөвшөөрнө",
                  ),
                ),
              ],
            ),

            const Spacer(),

            // Start button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  if (!privacyAccepted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Нууцлалын бодлогыг зөвшөөрнө үү."),
                      ),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GenderAgeScreen()),
                  );
                },
                child: const Text(
                  "ЭХЛЭХ",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
