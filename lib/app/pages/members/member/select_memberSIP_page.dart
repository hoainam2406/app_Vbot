import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/pages/members/member/info_select_memberSIP_page.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectMemberSIPPage extends StatefulWidget {
  const SelectMemberSIPPage({super.key});

  @override
  State<SelectMemberSIPPage> createState() => _SelectMemberSIPPageState();
}

class _SelectMemberSIPPageState extends State<SelectMemberSIPPage> {
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
                  'Thêm tài khoản thiết bị',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
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
              child: Wrap(
                runSpacing: 0,
                children: [
                  for (int i = 1; i < 15; i++) const InfoSelectMemberSIPPage(),
                ],
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
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white),
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
