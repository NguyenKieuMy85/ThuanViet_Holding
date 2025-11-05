import 'package:flutter/material.dart';
import 'project_tab.dart';
import 'news_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // LOGO cố định
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Image.asset(
                'assets/images/logo_thuanviet.png',
                width: MediaQuery.of(context).size.width * 0.9,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // TabBar
          TabBar(
            controller: _tabController,
            labelColor: const Color(0xFF8B1E1E),
            unselectedLabelColor: Colors.black54,
            labelStyle: const TextStyle(
              fontSize: 20, // ✅ chỉnh kích thước chữ
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 20, // ✅ chỉnh  thước chữ
            ),
            indicator: UnderlineTabIndicator(
              borderSide: const BorderSide(
                width: 3,
                color: Color(0xFF8B1E1E),
              ),
              insets: EdgeInsets.symmetric(
                horizontal:
                (MediaQuery.of(context).size.width / 2 -
                    (MediaQuery.of(context).size.width / 2) / 2),
              ),
            ),
            tabs: const [
              Tab(text: 'Dự án'),
              Tab(text: 'Tin tức'),
            ],
          ),

          // Nội dung Tab
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ProjectTab(),
                NewsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

