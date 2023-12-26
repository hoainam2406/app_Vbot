import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/pages/members/group/info_select_member_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectMemberPage extends StatefulWidget {
  const SelectMemberPage({super.key});

  @override
  State<SelectMemberPage> createState() => _SelectMemberPageState();
}

class _SelectMemberPageState extends State<SelectMemberPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 800,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                  'Chọn thành viên',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                const SizedBox()
              ],
            ),
          ),
          const Divider(
            height: 1,
          ),
          Expanded(
            child: SingleChildScrollView(
              // padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Column(
                children: [
                  for (int i = 1; i < 15; i++) const InfoSelectMemberPage(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Spacer(),
                VPMOutlinedButtonAdd2(
                  child: const Text(
                    'Xác nhận',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
