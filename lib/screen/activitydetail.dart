import 'package:flutter/material.dart';

class ActivityDetailScreen extends StatefulWidget {
  final Map<String, dynamic> activity;

  const ActivityDetailScreen({super.key, required this.activity});

  @override
  State<ActivityDetailScreen> createState() => _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends State<ActivityDetailScreen> {
  int quantity = 0;
  String unit = "min";

  // kcal = MET × weight(kg) × hours
  // Weight = 70kg (default)
  double getCaloriesBurned() {
    double hours =
    unit == "min" ? quantity / 60 : quantity.toDouble();
    return widget.activity["met"] * 70 * hours;
  }

  @override
  Widget build(BuildContext context) {
    final kcal = getCaloriesBurned();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${widget.activity['name']} ${widget.activity['detail']}",
              style:
              const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),

            // BIG ICON
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Icon(widget.activity['icon'], size: 70),
            ),

            const SizedBox(height: 20),

            Text(
              "~ ${kcal.toStringAsFixed(0)} kcal / $quantity $unit",
              style: const TextStyle(fontSize: 20, color: Colors.black87),
            ),

            const SizedBox(height: 25),

            // Quantity + unit
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // QUANTITY BOX
                SizedBox(
                  width: 110,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Quantity",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (v) {
                      setState(() => quantity = int.tryParse(v) ?? 0);
                    },
                  ),
                ),
                const SizedBox(width: 18),

                // UNIT DROPDOWN
                SizedBox(
                  width: 90,
                  child: DropdownButtonFormField<String>(
                    value: unit,
                    items: const [
                      DropdownMenuItem(
                          value: "min", child: Text("min")),
                      DropdownMenuItem(
                          value: "hour", child: Text("hour")),
                    ],
                    onChanged: (v) {
                      setState(() => unit = v!);
                    },
                    decoration: const InputDecoration(
                      labelText: "Unit",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),

            const Spacer(),

            // ADD BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                onPressed: () {
                  Navigator.pop(context, kcal.toInt());
                },
                child: const Text("Add",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
