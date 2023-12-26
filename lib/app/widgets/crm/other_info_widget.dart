import 'package:app_vbot/app/components/card.dart';
import 'package:flutter/material.dart';

class OtherInfoWidget extends StatelessWidget {
  const OtherInfoWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return CardVbot(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CardVbot(
                padding: const EdgeInsets.all(0),
                child: Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    child: Text(index.toString())),
              ),
              const SizedBox(
                width: 4,
              ),
              const Expanded(
                // width: 230,
                child: Text(
                  'Chưa bao giờ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            padding: const EdgeInsets.only(left: 4),
            // width: 280,
            child: const Text(
              'Cần thanh lý nhanh máy tính laptop mới 99% ở Trương Định Hoàng Mai ạ. Liên hệ 0906436568 Tìm đồng đội đá hộ trận chiều mai hoàn toàn free. Do đội mình thiếu ng cần nhờ 3 bạn đi đá hộ vào 19h thứ 6 ngày 01/12 sân Phúc Thanh đường Đỗ Đức Dục. Bạn nào đi được ping mình với. Mình cảm ơn',
            ),
          ),
        ],
      ),
    );
  }
}
