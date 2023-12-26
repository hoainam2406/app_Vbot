import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderMembers extends StatefulWidget {
  const HeaderMembers({super.key});

  @override
  State<HeaderMembers> createState() => _HeaderMembersState();
}

class _HeaderMembersState extends State<HeaderMembers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8, left: 12, right: 12, top: 8),
      // margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          border: const Border(
            bottom: BorderSide(width: .3),
          ),
          color: appBarColor),
      child: const Row(
        children: [
          Expanded(
            flex: 9,
            child: Text(
              'Thành viên',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 20,
            width: 12,
            child: VerticalDivider(
              thickness: 1,
            ),
          ),
          Expanded(
            flex: 5,
            child: Text('VBot ID/Account SIP',
                style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          // SizedBox(
          //   height: 20,
          //   width: 12,
          //   child: VerticalDivider(
          //     thickness: 1,
          //   ),
          // ),
          // Expanded(
          //   flex: 3,
          //   child: Text('Khách hàng',
          //       style: TextStyle(fontWeight: FontWeight.w600)),
          // ),
          SizedBox(
            height: 20,
            width: 12,
            child: VerticalDivider(
              thickness: 1,
            ),
          ),
          Expanded(
            flex: 4,
            child:
                Text('Chức vụ', style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: 20,
            width: 12,
            child: VerticalDivider(
              thickness: 1,
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              'Tài khoản',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 20,
            width: 12,
            child: VerticalDivider(
              thickness: 1,
            ),
          ),
          Expanded(
            flex: 4,
            child: Text('Số máy lẻ',
                style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: 20,
            width: 12,
            child: VerticalDivider(
              thickness: 1,
            ),
          ),
          Expanded(
            flex: 10,
            child: Text('Hotline quản lý',
                style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: 20,
            width: 12,
            child: VerticalDivider(
              thickness: 1,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text('Hành động',
                style: TextStyle(fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
