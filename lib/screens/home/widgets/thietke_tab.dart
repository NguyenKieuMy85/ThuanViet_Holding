// 📁 lib/widgets/thietke_tab.dart
import 'package:flutter/material.dart';
import 'loai7_tab.dart';

class ThietKeTab extends StatelessWidget {
  final String projectName; // ✅ thêm biến nhận tên project

  const ThietKeTab({super.key, required this.projectName});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/thiet_ke.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B1E1E),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  '3 PN / BR',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8),

              // 👉 Khi bấm, truyền projectName qua Loai7Tab
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE3E2E2),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Loai7Tab(projectName: projectName), // ✅ truyền đúng tên project
                    ),
                  );
                },
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'LOẠI / TYPE 7',
                    style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text('GSA: 90.6 - 120.7 m²', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              SizedBox(height: 4),
              Text('NSA: 66.88 - 88.16 m²', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }
}




