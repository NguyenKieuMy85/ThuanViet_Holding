import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final List<String> _locations = [
    'Tất cả',
    'Đà Nẵng',
    'Hồ Chí Minh',
    'Hà Nội',
  ];
  final List<String> _status = [
    'Tất cả',
    'Đang mở bán',
    'Sắp mở bán',
    'Đã bàn giao',
  ];

  String? _selectedLocation = 'Tất cả';
  String? _selectedStatus = 'Tất cả';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tìm kiếm nâng cao',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _selectedLocation = 'Tất cả';
                      _selectedStatus = 'Tất cả';
                    });
                  },
                  child: const Text(
                    'Xóa bộ lọc',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Bộ lọc vị trí
            const Text('Vị trí', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Column(
              children:
                  _locations.map((location) {
                    return RadioListTile<String>(
                      value: location,
                      groupValue: _selectedLocation,
                      activeColor: Colors.red,
                      onChanged: (value) {
                        setState(() {
                          _selectedLocation = value;
                        });
                      },
                      title: Text(location),
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                    );
                  }).toList(),
            ),

            const SizedBox(height: 10),

            // Bộ lọc trạng thái
            const Text(
              'Trạng thái',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Column(
              children:
                  _status.map((status) {
                    return RadioListTile<String>(
                      value: status,
                      groupValue: _selectedStatus,
                      activeColor: Colors.red,
                      onChanged: (value) {
                        setState(() {
                          _selectedStatus = value;
                        });
                      },
                      title: Text(status),
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                    );
                  }).toList(),
            ),

            const SizedBox(height: 20),

            // Nút áp dụng
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  // TODO: Trả kết quả filter về màn hình ProjectTab
                  Navigator.pop(context, {
                    'location': _selectedLocation,
                    'status': _selectedStatus,
                  });
                },
                child: const Text(
                  'Áp dụng',
                  style: TextStyle(fontSize: 16, color: Color(0xFF8B1E1E)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
