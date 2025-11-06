import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet>
    with SingleTickerProviderStateMixin {
  bool showLocation = false;
  bool showStatus = false;

  final List<String> locations = ['Chọn tất cả', 'Đà Nẵng', 'Hồ Chí Minh', 'Hà Nội'];
  final List<String> statuses = ['Chọn tất cả', 'Đang mở bán', 'Sắp mở bán', 'Đã bàn giao'];

  List<String> selectedLocations = [];
  List<String> selectedStatuses = [];

  void clearFilters() {
    selectedLocations.clear();
    selectedStatuses.clear();
    setState(() {});
  }

  void toggleAll() {
    if (!showLocation && !showStatus) {
      showLocation = true;
      showStatus = true;
    } else if (showLocation != showStatus) {
      showLocation = true;
      showStatus = true;
    } else {
      showLocation = false;
      showStatus = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 900,
      padding: const EdgeInsets.all(14),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      child: Column(
        children: [
          // ==== HEADER ====
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, size: 24),
              ),
              const Spacer(),
              const Text(
                "Tìm kiếm nâng cao",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              GestureDetector(
                onTap: clearFilters,
                child: const Text(
                  "Xóa bộ lọc",
                  style: TextStyle(fontSize: 14, color: Colors.red),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ==== ĐƯỜNG NGANG TRÊN ====
          Container(
            height: 8,
            color: const Color(0xFFF8F8F8),
          ),

          const SizedBox(height: 8),

          // ==== SEARCH BAR + FILTER BUTTON ====
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    hintText: "Tìm theo dự án, trạng thái",
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: const Color(0xFFF8F8F8),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: toggleAll,
                child: const CircleAvatar(
                  radius: 18,
                  backgroundColor: Color(0xFF8B1E1E),
                  child: Icon(Icons.filter_list, color: Colors.white, size: 18),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // ==== ĐƯỜNG NGANG DƯỚI ====
          Container(
            height: 8,
            color: const Color(0xFFF8F8F8),
          ),

          const SizedBox(height: 12),

          // ==== SCROLLABLE NỘI DUNG ====
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // ==== VỊ TRÍ ====
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => setState(() => showLocation = !showLocation),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          const Text(
                            "Vị trí",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            showLocation ? Icons.expand_less : Icons.expand_more,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  AnimatedCrossFade(
                    firstChild: const SizedBox.shrink(),
                    secondChild: Column(
                      children: locations
                          .map((loc) => buildOptionRow(
                        label: loc,
                        list: selectedLocations,
                        allItems: locations,
                      ))
                          .toList(),
                    ),
                    crossFadeState: showLocation
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 250),
                  ),

                  const SizedBox(height: 10),

                  // ==== TRẠNG THÁI ====
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => setState(() => showStatus = !showStatus),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          const Text(
                            "Trạng thái",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            showStatus ? Icons.expand_less : Icons.expand_more,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ==== NỀN XÁM SAU TRẠNG THÁI ====
                  Container(
                    width: double.infinity,
                    color: const Color(0xFFF8F8F8),
                    child: Column(
                      children: [
                        AnimatedCrossFade(
                          firstChild: const SizedBox.shrink(),
                          secondChild: Column(
                            children: statuses
                                .map((st) => buildOptionRow(
                              label: st,
                              list: selectedStatuses,
                              allItems: statuses,
                            ))
                                .toList(),
                          ),
                          crossFadeState: showStatus
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          duration: const Duration(milliseconds: 250),
                        ),

                        const SizedBox(height: 620), // ✅ giữ nguyên khoảng trống
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ==== APPLY BUTTON ====
          Container(
            color: const Color(0xFFF8F8F8), // ✅ nền sau nút áp dụng cũng F8F8F8
            padding: const EdgeInsets.only(top: 12, bottom: 14),
            child: SizedBox(
              width: 140,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B1E1E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () {
                  Navigator.pop(context, {
                    'location': selectedLocations,
                    'status': selectedStatuses,
                  });
                },
                child: const Text("Áp dụng", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==== BUILD OPTION ROW ====
  Widget buildOptionRow({
    required String label,
    required List<String> list,
    required List<String> allItems,
  }) {
    final bool isSelected = list.contains(label);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _toggleSelection(label, list, allItems),
      child: Container(
        margin: const EdgeInsets.only(top: 1),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          color: Color(0xFFF8F8F8),
          border: Border(bottom: BorderSide(color: Color(0xFFF3F3F3))),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Checkbox(
              value: isSelected,
              onChanged: (_) => _toggleSelection(label, list, allItems),
              side: const BorderSide(color: Color.fromRGBO(0, 0, 0, 0.2), width: 3),
              activeColor: const Color(0xFF8B1E1E),
              checkColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  void _toggleSelection(String label, List<String> list, List<String> allItems) {
    setState(() {
      if (label == 'Chọn tất cả') {
        if (list.length == allItems.length) {
          list.clear();
        } else {
          list
            ..clear()
            ..addAll(allItems);
        }
      } else {
        if (list.contains(label)) {
          list.remove(label);
          list.remove('Chọn tất cả');
        } else {
          list.add(label);
          if (list.toSet().containsAll(allItems.where((e) => e != 'Chọn tất cả'))) {
            if (!list.contains('Chọn tất cả')) list.add('Chọn tất cả');
          }
        }
      }
    });
  }
}







































