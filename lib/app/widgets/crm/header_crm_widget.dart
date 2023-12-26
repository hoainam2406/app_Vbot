import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderCRMWidget extends StatelessWidget {
  const HeaderCRMWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8, left: 12, right: 12, top: 8),
      // margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: .3),
          ),
          color: appBarColor),
      child: const Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              'Mã khách hàng',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            width: 12,
            height: 20,
            child: VerticalDivider(thickness: 1),
          ),
          Expanded(
            flex: 3,
            child: Text('Khách hàng',
                style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: 20,
            width: 12,
            child: VerticalDivider(thickness: 1),
          ),
          Expanded(
            flex: 6,
            child: Text('Số điện thoại',
                style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: 20,
            width: 12,
            child: VerticalDivider(thickness: 1),
          ),
          Expanded(
            flex: 3,
            child: Text('Trạng thái',
                style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: 20,
            width: 12,
            child: VerticalDivider(thickness: 1),
          ),
          Expanded(
            flex: 3,
            child: Text('Nhóm', style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: 20,
            width: 12,
            child: VerticalDivider(thickness: 1),
          ),
          Expanded(
            flex: 3,
            child: Text('Loại', style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: 20,
            width: 12,
            child: VerticalDivider(thickness: 1),
          ),
          Expanded(
            flex: 2,
            child: Text('Hành động',
                style: TextStyle(fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
