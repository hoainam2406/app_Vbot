import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoGroupMemberManageWidget extends StatefulWidget {
  const InfoGroupMemberManageWidget({super.key});

  @override
  State<InfoGroupMemberManageWidget> createState() =>
      _InfoGroupMemberManageWidgetState();
}

class _InfoGroupMemberManageWidgetState
    extends State<InfoGroupMemberManageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: .3),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(12)),
            alignment: Alignment.center,
            child: const Text(
              'HN',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hoài Nam',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              // Text('VBot ID: hoainam07'),
              Text('Số máy lẻ: 123')
            ],
          ),
          const Spacer(),
          VPMIconButton(
            icon: const Icon(
              Icons.close_outlined,
              size: 20,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
