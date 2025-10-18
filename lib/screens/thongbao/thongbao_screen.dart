import 'package:flutter/material.dart';

class ThongBaoScreen extends StatelessWidget {
  const ThongBaoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thông báo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[700],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 5, // mock data
        itemBuilder: (context, index) {
          return Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              leading: const Icon(Icons.notifications, color: Colors.red),
              title: Text('Thông báo số ${index + 1}'),
              subtitle: const Text('Nội dung thông báo mô tả ngắn gọn...'),
              onTap: () {
                // TODO: mở chi tiết thông báo
              },
            ),
          );
        },
      ),
    );
  }
}
