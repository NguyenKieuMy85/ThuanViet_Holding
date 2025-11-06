import 'package:flutter/material.dart';
import 'widgets/thongtin_tab.dart';
import 'widgets/thuvien_tab.dart';
import 'widgets/thietke_tab.dart'; // ✅ thêm dòng này

class ProjectDetailScreen extends StatefulWidget {
  final String projectName;

  const ProjectDetailScreen({super.key, required this.projectName});

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B1E1E),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.projectName,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/Danko_city.png',
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),

          // --- TAB BAR ---
          TabBar(
            controller: _tabController,
            labelColor: const Color(0xFF8B1E1E),
            unselectedLabelColor: Colors.black54,
            labelStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            indicatorColor: const Color(0xFF8B1E1E),
            tabs: const [
              Tab(text: 'Thông tin'),
              Tab(text: 'Thư viện'),
              Tab(text: 'Thiết kế'),
            ],
          ),

          // --- TAB VIEW ---
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                const ThongTinTab(),
                const ThuvienTab(),
                ThietKeTab(
                  projectName: widget.projectName,
                ), // ✅ truyền tên project
              ],
            ),
          ),

          // --- NÚT LIÊN HỆ ---
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B1E1E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Liên hệ',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
