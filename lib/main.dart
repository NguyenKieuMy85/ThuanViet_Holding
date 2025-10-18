import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';
import 'screens/quanly/quanly_screen.dart';
import 'screens/thongbao/thongbao_screen.dart';
import 'screens/taikhoan/taikhoan_screen.dart';

void main() {
  runApp(const ThuanVietApp());
}

class ThuanVietApp extends StatelessWidget {
  const ThuanVietApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thuan Viet Holding',
      theme: ThemeData(primaryColor: Colors.red[700], fontFamily: 'Roboto'),
      home: const MainBottomNav(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainBottomNav extends StatefulWidget {
  const MainBottomNav({super.key});

  @override
  State<MainBottomNav> createState() => _MainBottomNavState();
}

class _MainBottomNavState extends State<MainBottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    QuanLyScreen(),
    ThongBaoScreen(),
    TaiKhoanScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF8B1E1E),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Quản lý',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Thông báo',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tài khoản'),
        ],
      ),
    );
  }
}
