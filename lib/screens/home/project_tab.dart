import 'package:flutter/material.dart';
import 'widgets/search_bar.dart';
import 'filter_bottomsheet.dart';
import 'widgets/project_card.dart';

class ProjectTab extends StatelessWidget {
  const ProjectTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Thanh tìm kiếm + filter
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(child: SearchBarWidget()),
              IconButton(
                icon: const Icon(Icons.filter_list, color: Colors.red),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => const FilterBottomSheet(),
                  );
                },
              ),
            ],
          ),
        ),

        // Danh sách dự án (mock)
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder:
                (context, index) => ProjectCard(
                  imageUrl: 'https://example.com/image_$index.jpg',
                  projectName: 'Project $index',
                  location: 'Location $index',
                  status: 'Status $index',
                ),
          ),
        ),
      ],
    );
  }
}
