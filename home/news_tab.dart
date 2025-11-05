import 'package:flutter/material.dart';
import 'widgets/news_card.dart';

class NewsTab extends StatelessWidget {
  const NewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Danh sách tin tức
        Expanded(
          child: ListView.builder(
            itemCount: 5, // mock data trước
            itemBuilder: (context, index) {
              return const NewsCard(
                imageUrl: 'https://picsum.photos/400/200', // ảnh tạm thời
                title: 'Khánh thành Bệnh viện Ung bướu TP.HCM cơ sở 2',
                description:
                    'Với quy mô 1.000 giường, đây là công trình y tế trọng điểm của thành phố.',
              );
            },
          ),
        ),
      ],
    );
  }
}
