import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoGroupCustomerWidget extends StatefulWidget {
  const InfoGroupCustomerWidget({super.key});

  @override
  State<InfoGroupCustomerWidget> createState() =>
      _InfoGroupCustomerWidgetState();
}

class _InfoGroupCustomerWidgetState extends State<InfoGroupCustomerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .3, color: borderColor),
          // bottom: BorderSide(width: .3),
        ),
      ),
      width: double.maxFinite,
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(width: .3, color: borderColor),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: const Text(
              'HN',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.black),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hoài Nam',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black)),
                Text('10 khách hàng', style: TextStyle(color: Colors.black)),
                Text(
                  'Ví dụ bạn cần lấy 1 chuỗi dài, nhưng nếu chuỗi đó có chứa 1 ký tự đặt biệt nào đó, ví dụ ký tự / thì không được lấy dòng đó. Nghĩa là cần loại bỏ 1 ký tự đặc biệt ra khỏi tập kết quả (group matches) thu được.',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
