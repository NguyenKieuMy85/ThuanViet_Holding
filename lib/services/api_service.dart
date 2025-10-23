import 'dart:convert';
import 'package:http/http.dart' as http;
import '../screens/home/project_tab.dart';
import '../screens//home/news_tab.dart';
import '../models/project.dart';
import '../models/news.dart';

class ApiService {
  // ⚠️ Nếu chạy trên Android Emulator → thay localhost bằng 10.0.2.2
  static const String baseUrl = "http://10.0.2.2:5000";

  Future<List<Project>> getProjects() async {
    final response = await http.get(Uri.parse("$baseUrl/api/projects"));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => Project.fromJson(e)).toList();
    } else {
      throw Exception('Lỗi tải danh sách dự án');
    }
  }

  Future<List<News>> getNews() async {
    final response = await http.get(Uri.parse("$baseUrl/api/news"));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => News.fromJson(e)).toList();
    } else {
      throw Exception('Lỗi tải danh sách tin tức');
    }
  }
}
