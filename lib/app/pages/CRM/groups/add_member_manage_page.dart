import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/widgets/crm/groups/info_member_manage_check_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMemberManagePage extends StatefulWidget {
  const AddMemberManagePage({super.key});

  @override
  State<AddMemberManagePage> createState() => _AddMemberManagePageState();
}

class _AddMemberManagePageState extends State<AddMemberManagePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                'Thành viên quản lý',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              const SizedBox()
            ],
          ),
        ),
        const Divider(),
        Container(
          height: 50,
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
          child: SearchBar(
            shadowColor: const MaterialStatePropertyAll(Colors.transparent),
            side: const MaterialStatePropertyAll(
              BorderSide(width: .3),
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            leading: const Icon(
              CupertinoIcons.search,
              size: 20,
            ),
            hintText: 'Tìm kiếm',
          ),
        ),
        // const SizedBox(
        //   height: 12,
        // ),
        Expanded(
          child: SingleChildScrollView(
            // padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
            child: Column(
              children: [
                for (int i = 0; i < 10; i++) const InfoMemberManageCheckWidget()
              ],
            ),
          ),
        ),
        // const SizedBox(
        //   height: 12,
        // ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: VPMOutlinedButtonAdd2(
            child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: const Text(
                  'Lưu',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white),
                )),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        )
      ],
    );
  }
}
