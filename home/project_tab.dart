import 'package:flutter/material.dart';
import 'widgets/search_bar.dart';
import 'filter_bottomsheet.dart';
import 'widgets/project_card.dart';

class ProjectTab extends StatelessWidget {
  const ProjectTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Danh sách project mẫu
    final List<Map<String, String>> projects = [
      {
        'name': 'New City Thủ Thiêm 1',
        'location': 'Đà Nẵng',
        'status': 'Sắp mở bán',
      },
      {
        'name': 'New City Thủ Thiêm',
        'location': 'Hồ Chí Minh',
        'status': 'Đang mở bán',
      },
      {
        'name': 'New City Thủ Thiêm 2',
        'location': 'Hà Nội',
        'status': 'Sắp mở bán',
      },
      {
        'name': 'New City Thủ Thiêm 3',
        'location': 'Hà Nội',
        'status': 'Sắp mở bán',
      },
      {
        'name': 'New City Thủ Thiêm 4',
        'location': 'Hồ Chí Minh',
        'status': 'Đã bàn giao',
      },
    ];

    return Column(
      children: [
        // Thanh tìm kiếm + filter
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(child: SearchBarWidget()),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) => const FilterBottomSheet(),
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF8B1E1E), // màu đỏ filter
                    shape: BoxShape.circle,
                  ),
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: const Icon(Icons.filter_list,
                      color: Colors.white, size: 18),
                ),
              ),
            ],
          ),
        ),

        // Danh sách dự án
        Expanded(
          child: ListView.builder(
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              final imageUrl = 'assets/images/Project_card_demo.png' ;

              return ProjectCard(
                imageUrl: imageUrl,
                projectName: project['name']!,
                location: project['location']!,
                status: project['status']!,
                onContactPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                      Text('Đang liên hệ ${project['name']}...'),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}




