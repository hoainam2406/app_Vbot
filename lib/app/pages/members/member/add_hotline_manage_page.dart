import 'package:app_vbot/app/widgets/members/hotline_manage_selected_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_vbot/app/components/button_vpm.dart';

class AddHotlineManagePage extends StatefulWidget {
  const AddHotlineManagePage({super.key});

  @override
  State<AddHotlineManagePage> createState() => _AddHotlineManagePageState();
}

class _AddHotlineManagePageState extends State<AddHotlineManagePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                'Thêm hotline quản lý',
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
            child: Column(
              children: [
                for (int i = 0; i < 5; i++)
                  const HotlineManageSelectedWidget(selected: true),
                for (int i = 0; i < 5; i++)
                  const HotlineManageSelectedWidget(selected: false),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
