import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderHistoryCall extends StatefulWidget {
  const HeaderHistoryCall({super.key});

  @override
  State<HeaderHistoryCall> createState() => _HeaderHistoryCallState();
}

class _HeaderHistoryCallState extends State<HeaderHistoryCall> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8, left: 12, right: 0, top: 8),
      // margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          border: const Border(
            bottom: BorderSide(
              color: Color(0xFFABABAB),
            ),
          ),
          color: appBarColor
          // color: Color.fromARGB(255, 200, 200, 200),
          ),
      child: const Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              'Thời gian gọi',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          // SizedBox(
          //   width: 12,
          // ),
          SizedBox(
            height: 20,
            width: 12,
            child: VerticalDivider(
              thickness: 1,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text('Thời lượng',
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
            flex: 6,
            child: Text('Khách hàng',
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
            flex: 6,
            child: Text('Thành viên',
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
            flex: 4,
            child: Text('Loại', style: TextStyle(fontWeight: FontWeight.w600)),
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
            child:
                Text('Hotline', style: TextStyle(fontWeight: FontWeight.w600)),
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
            child:
                Text('Cước gọi', style: TextStyle(fontWeight: FontWeight.w600)),
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
            child: Text('Khác', style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: 20,
            width: 12,
            // child: VerticalDivider(
            //   thickness: 1,
            // ),
          ),
          Expanded(
            flex: 2,
            child: Text(''),
          ),
        ],
      ),
    );
  }
}
