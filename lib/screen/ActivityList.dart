import 'package:flutter/material.dart';
import 'activitydetail.dart';

class ActivityListScreen extends StatefulWidget {
  const ActivityListScreen({super.key});

  @override
  State<ActivityListScreen> createState() => _ActivityListScreenState();
}

class _ActivityListScreenState extends State<ActivityListScreen> {
  String search = "";

  final List<Map<String, dynamic>> activities = [
    {
      "name": "bicycling",
      "detail": "general",
      "icon": Icons.pedal_bike,
      "met": 7.5
    },
    {
      "name": "bicycling, mountain",
      "detail": "general",
      "icon": Icons.pedal_bike,
      "met": 8.5
    },
    {
      "name": "unicycling",
      "detail": "general",
      "icon": Icons.circle,
      "met": 5.0
    },
    {
      "name": "resistance training",
      "detail": "free weight",
      "icon": Icons.fitness_center,
      "met": 6.0
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = activities
        .where((a) => a["name"].toLowerCase().contains(search.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Activity",
            style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.w600)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // SEARCH BOX
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                    icon: Icon(Icons.search)),
                onChanged: (v) {
                  setState(() => search = v);
                },
              ),
            ),

            const SizedBox(height: 18),

            // LIST
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final item = filtered[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.green.shade100,
                          child: Icon(item['icon'], color: Colors.black),
                        ),
                        const SizedBox(width: 16),

                        // NAME + DETAIL
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['name'],
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600)),
                            Text(item['detail'],
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.black54)),
                          ],
                        ),

                        const Spacer(),

                        // ADD BUTTON
                        IconButton(
                          icon: const Icon(Icons.add, size: 26),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ActivityDetail(activity: item),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
