import 'package:flutter/material.dart';

class TaiKhoanScreen extends StatelessWidget {
  const TaiKhoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tài khoản',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[700],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  'Tên người dùng',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'email@example.com',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.person_outline, color: Colors.red),
                  title: const Text('Thông tin cá nhân'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                const Divider(height: 0),

                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.red),
                  title: const Text('Cài đặt'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                const Divider(height: 0),

                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text('Đăng xuất'),
                  onTap: () {
                    // TODO: Xử lý đăng xuất
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
