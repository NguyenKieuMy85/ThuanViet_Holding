import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ThongTinTab extends StatefulWidget {
  const ThongTinTab({super.key});

  @override
  State<ThongTinTab> createState() => _ThongTinTabState();
}

class _ThongTinTabState extends State<ThongTinTab> {
  final String duAnLink =
      'https://www.google.com/maps/place/New+City+Thu+Thiem/@10.780608,106.7358052,3a,75y,321.43h,90t/data=!3m8!1e1!3m6!1sCIHM0ogKEICAgIDal-bfGg!2e10!3e11!6shttps:%2F%2Flh3.googleusercontent.com%2Fgpms-cs-s%2FAPRy3c_F_qhRV0mFppwxPrj3G5JrW9DzpOJigvpTTdq-zpweW11uokffkYdShe5PiRxNRadOBMx2RoX2sqgbrjOZBkWDsnQtoCXMtaF0gJfuHXeJmIAEUFKWHDAZF7Oarg2Scxx_Nw8%3Dw900-h600-k-no-pi0-ya32.97032891995366-ro0-fo100!7i7680!8i3840!4m6!3m5!1s0x31752539977e4517:0x104d2416790f1399!8m2!3d10.780773!4d106.7355882!16s%2Fg%2F11q_lf8b2w?entry=ttu&g_ep=EgoyMDI1MTAyOC4wIKXMDSoASAFQAw%3D%3D'; // dùng link đầy đủ
  final String nhaMauLink =
      'https://www.google.com/maps/search/10.780831942942605,+106.73574427916256?sa=X&ved=1t:242&ictx=111'; // dùng link đầy đủ

  Future<void> _openLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Không thể mở liên kết')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          // -------- ĐỊA CHỈ DỰ ÁN --------
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Địa chỉ dự án',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () => _openLink(duAnLink),
                child: const Text(
                  'Xem 360',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // 📍 Địa chỉ
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.location_on, color: Colors.redAccent, size: 20),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Quận 2, Hồ Chí Minh',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 4),
                    InkWell(
                      onTap: () => _openLink(duAnLink),
                      child: const Text(
                        'Xem trên bản đồ',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // -------- ĐỊA CHỈ NHÀ MẪU --------
          const Text(
            'Địa chỉ nhà mẫu',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.location_on, color: Colors.redAccent, size: 20),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'New City Thủ Thiêm, Quận 2, Hồ Chí Minh',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 4),
                    InkWell(
                      onTap: () => _openLink(nhaMauLink),
                      child: const Text(
                        'Xem trên bản đồ',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // -------- TÓM TẮT DỰ ÁN --------
          const Text(
            'Tóm tắt dự án',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(width: 26),
              Expanded(
                child: Text(
                  'The Grand City là khu đô thị hiện đại tọa lạc tại trung tâm Quận 2, TP. Hồ Chí Minh. '
                      'Dự án bao gồm các căn hộ cao cấp, biệt thự sang trọng và shophouse thương mại, đáp ứng nhu cầu ở.',
                  style: TextStyle(fontSize: 18, height: 1.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



