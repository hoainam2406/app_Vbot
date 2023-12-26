import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HotlineManageSelectedWidget extends StatelessWidget {
  const HotlineManageSelectedWidget({super.key, required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: .3, color: borderColor))),
      child: VPMTextButton(
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(
            EdgeInsets.all(0),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
        ),
        onPressed: () {
          if (!selected) {
            addDialog(
              context: context,
              content: 'Thêm hotline 0395001595 cho Hoài Nam quản lý',
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              const Text(
                '0395001595',
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
              ),
              const Spacer(),
              if (selected)
                const Text(
                  'Đã thêm',
                  style: TextStyle(color: Colors.green),
                ),
              const SizedBox(
                width: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
