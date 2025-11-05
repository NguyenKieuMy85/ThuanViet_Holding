import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './widgets/news_card.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  List<dynamic> _newsList = [];
  bool _isLoading = true;
  bool _hasError = false;

  // ⚙️ Đổi URL này bằng API NodeJS thật của bạn
  final String apiUrl = "http://10.0.2.2:5000/api/news";
  // ⚠️ Ghi nhớ:
  // - Dùng 10.0.2.2 nếu chạy trên Android emulator
  // - Dùng IP LAN (vd 192.168.1.xxx) nếu chạy app trên điện thoại thật cùng mạng Wi-Fi

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        setState(() {
          _newsList = data;
          _isLoading = false;
          _hasError = false;
        });
      } else {
        setState(() {
          _hasError = true;
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint(" Lỗi khi tải tin tức: $e");
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child:
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _hasError
                  ? const Center(
                    child: Text(
                      'Không thể tải tin tức. Vui lòng thử lại sau.',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                  : RefreshIndicator(
                    onRefresh: fetchNews,
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: _newsList.length,
                      itemBuilder: (context, index) {
                        final news = _newsList[index];
                        final imageUrl =
                            news['image'] != null &&
                                    news['image'].toString().isNotEmpty
                                ? "http://10.0.2.2:5000${news['image']}"
                                : "https://via.placeholder.com/400x200?text=No+Image";

                        final title = news['title'] ?? 'Không có tiêu đề';
                        final project = news['project'] ?? 'Không có dự án';
                        final date = news['date'] ?? '';
                        final link = news['link'] ?? '';

                        return NewsCard(
                          imageUrl: imageUrl,
                          title: title,
                          description: "$project • $date",
                          link: link,
                        );
                      },
                    ),
                  ),
        ),
      ],
    );
  }
}
