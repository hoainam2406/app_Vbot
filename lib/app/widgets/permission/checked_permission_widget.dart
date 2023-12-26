import 'package:flutter/material.dart';

class CheckPermission extends StatefulWidget {
  const CheckPermission({super.key});

  @override
  State<CheckPermission> createState() => _CheckPermissionState();
}

class _CheckPermissionState extends State<CheckPermission> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 12),
      decoration: BoxDecoration(
          border: Border.all(width: .3),
          borderRadius: BorderRadius.circular(12)),
      child: const Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Quản lý thành viên'),
            Divider(),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text('- Chỉnh sửa thông tin thành viên'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text('- Gia hạn thành viên'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text('- Thêm thành viên'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text('- Thêm tiền cho thành viên'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text('- Xem thông tin thành viên'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text('- Xóa thành viên'),
            ),
          ],
        ),
      ),
    );
  }
}
