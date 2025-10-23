import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'widgets/search_bar.dart';
import 'filter_bottomsheet.dart';
import 'widgets/project_card.dart';

class ProjectTab extends StatefulWidget {
  const ProjectTab({super.key});

  @override
  State<ProjectTab> createState() => _ProjectTabState();
}

class _ProjectTabState extends State<ProjectTab> {
  List<dynamic> _projects = [];
  List<dynamic> _filteredProjects = [];
  bool _isLoading = true;
  bool _hasError = false;

  final String apiUrl = "http://10.0.2.2:5000/api/projects";

  @override
  void initState() {
    super.initState();
    fetchProjects();
  }

  /// Lấy dữ liệu dự án từ API NodeJS
  Future<void> fetchProjects() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _projects = data;
          _filteredProjects = data; // ban đầu hiển thị toàn bộ
          _isLoading = false;
        });
      } else {
        setState(() {
          _hasError = true;
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
      debugPrint(" Lỗi khi tải dữ liệu dự án: $e");
    }
  }

  ///  Lọc theo từ khóa tìm kiếm
  void _onSearch(String query) {
    final lowerQuery = query.toLowerCase();
    setState(() {
      _filteredProjects =
          _projects.where((project) {
            final name = (project['project_name'] ?? '').toLowerCase();
            final location = (project['location'] ?? '').toLowerCase();
            return name.contains(lowerQuery) || location.contains(lowerQuery);
          }).toList();
    });
  }

  ///  Áp dụng bộ lọc từ FilterScreen
  void _applyFilter(Map<String, dynamic> filter) {
    final String search = filter['search']?.toLowerCase() ?? '';
    final String location = filter['location'] ?? 'Tất cả';
    final String status = filter['status'] ?? 'Tất cả';

    setState(() {
      _filteredProjects =
          _projects.where((project) {
            final name = (project['project_name'] ?? '').toLowerCase();
            final loc = project['location'] ?? '';
            final stt = project['status'] ?? '';

            final matchesSearch = search.isEmpty || name.contains(search);
            final matchesLocation =
                location == 'Tất cả' ||
                loc.toLowerCase() == location.toLowerCase();
            final matchesStatus =
                status == 'Tất cả' || stt.toLowerCase() == status.toLowerCase();

            return matchesSearch && matchesLocation && matchesStatus;
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //  Thanh tìm kiếm + nút Filter
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(child: SearchBarWidget(onSearch: _onSearch)),
              const SizedBox(width: 8),
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: Color(0xFF8B1E1E),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.filter_list, color: Colors.white),
                  iconSize: 18,
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FilterScreen(),
                      ),
                    );
                    if (result != null) {
                      _applyFilter(result); //  áp dụng lọc
                    }
                  },
                ),
              ),
            ],
          ),
        ),

        //  Danh sách dự án
        Expanded(
          child:
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _hasError
                  ? const Center(
                    child: Text(
                      'Không thể tải dữ liệu dự án.',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                  : RefreshIndicator(
                    onRefresh: fetchProjects,
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: _filteredProjects.length,
                      itemBuilder: (context, index) {
                        final project = _filteredProjects[index];

                        String imageUrl = project['main_image'] ?? '';
                        if (imageUrl.isNotEmpty &&
                            !imageUrl.startsWith('http')) {
                          imageUrl = 'http://10.0.2.2:5000$imageUrl';
                        }

                        return ProjectCard(
                          imageUrl: imageUrl,
                          projectName:
                              project['project_name'] ?? 'Không có tên dự án',
                          location: project['location'] ?? 'Chưa xác định',
                          status: project['status'] ?? '',
                          onContactPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Liên hệ về dự án: ${project['project_name']}',
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
        ),
      ],
    );
  }
}
