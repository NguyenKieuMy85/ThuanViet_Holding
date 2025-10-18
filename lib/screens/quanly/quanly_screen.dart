import 'package:flutter/material.dart';

class QuanLyScreen extends StatelessWidget {
  const QuanLyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quản lý',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[700],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.business_center, color: Colors.red),
            title: const Text('Quản lý dự án'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: điều hướng sang màn quản lý dự án
            },
          ),
          const Divider(height: 0),

          ListTile(
            leading: const Icon(Icons.assignment, color: Colors.red),
            title: const Text('Quản lý hợp đồng'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: điều hướng sang màn quản lý hợp đồng
            },
          ),
          const Divider(height: 0),

          ListTile(
            leading: const Icon(Icons.people, color: Colors.red),
            title: const Text('Quản lý khách hàng'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: điều hướng sang màn quản lý khách hàng
            },
          ),
        ],
      ),
    );
  }
}
