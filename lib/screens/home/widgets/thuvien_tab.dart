import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ThuvienTab extends StatefulWidget {
  const ThuvienTab({super.key});

  @override
  State<ThuvienTab> createState() => _ThuvienTabState();
}

class _ThuvienTabState extends State<ThuvienTab> {
  String selectedCategory = 'Tất cả';
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(
        'assets/danko_city_video.mp4',
      )
      ..initialize().then((_) {
        setState(() {});
        _videoController.setLooping(true);
        _videoController.play(); // <-- chạy tự động
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  // Dữ liệu mẫu
  final List<Map<String, dynamic>> allItems = [
    {'type': 'image', 'path': 'assets/images/Danko_city.png'},
    {'type': 'image', 'path': 'assets/images/Moi_nhat.png'},
    {'type': 'image', 'path': 'assets/images/Tat_ca.png'},
    {'type': 'image', 'path': 'assets/images/phong.png'},
    {'type': 'video', 'path': 'assets/videos/danko_city_video.mp4'},
  ];

  final Map<String, List<Map<String, dynamic>>> categoryItems = {
    'Tất cả': [
      {'type': 'image', 'path': 'assets/images/Danko_city.png'},
      {'type': 'image', 'path': 'assets/images/Moi_nhat.png'},
      {'type': 'image', 'path': 'assets/images/Tat_ca.png'},
      {'type': 'image', 'path': 'assets/images/phong.png'},
      {'type': 'video', 'path': 'assets/videos/danko_city_video.mp4'},
    ],
    'Mới nhất': [
      {'type': 'image', 'path': 'assets/images/Moi_nhat.png'},
    ],
    'Video': [
      {'type': 'video', 'path': 'assets/videos/danko_city_video.mp4'},
    ],
    'Phòng': [
      {'type': 'image', 'path': 'assets/images/phong.png'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final items = categoryItems[selectedCategory] ?? [];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // --- HÀNG CARD LỰA CHỌN ---
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryCard(
                  'Tất cả',
                  'assets/images/Tat_ca.png',
                  Alignment.bottomLeft,
                ),
                _buildCategoryCard(
                  'Mới nhất',
                  'assets/images/Moi_nhat.png',
                  Alignment.bottomLeft,
                ),
                _buildCategoryCard(
                  'Video',
                  'assets/images/Danko_city.png',
                  Alignment.bottomLeft,
                ),
                _buildCategoryCard(
                  'Phòng',
                  'assets/images/phong.png',
                  Alignment.bottomLeft,
                ),
              ],
            ),
          ),

          const Divider(),

          // --- HIỂN THỊ NỘI DUNG ---
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 cột
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                if (item['type'] == 'image') {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(item['path'], fit: BoxFit.cover),
                  );
                } else if (item['type'] == 'video' &&
                    _videoController.value.isInitialized) {
                  return AspectRatio(
                    aspectRatio: _videoController.value.aspectRatio,
                    child: VideoPlayer(_videoController),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  // --- WIDGET TẠO CARD CHO HÀNG TRÊN ---
  Widget _buildCategoryCard(
    String title,
    String imagePath,
    Alignment textAlign,
  ) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            selectedCategory = title;
          });
        },
        child: Card(
          elevation: selectedCategory == title ? 8 : 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            alignment: textAlign,
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
              Container(
                padding: const EdgeInsets.all(6),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
