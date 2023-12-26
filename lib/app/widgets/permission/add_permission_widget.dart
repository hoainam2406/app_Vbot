import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/widgets/permission/info_select_permission_widget.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPermissionWidget extends StatefulWidget {
  const AddPermissionWidget({super.key});

  @override
  State<AddPermissionWidget> createState() => _AddPermissionWidgetState();
}

class _AddPermissionWidgetState extends State<AddPermissionWidget> {
  Widget _buildSelectPermission() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: .3, color: borderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: const Column(
        children: [
          InfoSelectPermissionWidget(
            content: 'Quản lý thành viên',
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Column(
              children: [
                InfoSelectPermissionWidget(
                  content: 'Chỉnh sửa thông tin thành viên',
                ),
                InfoSelectPermissionWidget(
                  content: 'Gia hạn thành viên',
                ),
                InfoSelectPermissionWidget(
                  content: 'Thêm thành viên',
                ),
                InfoSelectPermissionWidget(
                  content: 'Thêm tiền cho thành viên',
                ),
                InfoSelectPermissionWidget(
                  content: 'Xem thông tin thành viên',
                ),
                InfoSelectPermissionWidget(
                  content: 'Xóa thành viên',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 800,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VPMIconButton(
                  icon: const Icon(
                    CupertinoIcons.back,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  tooltip: 'Quay lại',
                ),
                const Text(
                  'Chọn quyền quản lý',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const SizedBox()
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Wrap(
                  runSpacing: 12,
                  children: [
                    for (int i = 1; i < 5; i++) _buildSelectPermission()
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: .3,
                  color: borderColor,
                ),
              ),
            ),
            padding: const EdgeInsets.all(8.0),
            child: VPMOutlinedButtonAdd2(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: const Text(
                  'Xác nhận',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
