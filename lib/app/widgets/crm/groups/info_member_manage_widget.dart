import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:flutter/material.dart';

class InfoMemberManageWidget extends StatefulWidget {
  const InfoMemberManageWidget({super.key});

  @override
  State<InfoMemberManageWidget> createState() => _InfoMemberManageWidgetState();
}

class _InfoMemberManageWidgetState extends State<InfoMemberManageWidget> {
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
                color: Colors.green, borderRadius: BorderRadius.circular(12)),
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
              Text(
                'VBot ID: hoainam07',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                'Số máy lẻ: 123',
                style: TextStyle(fontSize: 14),
              )
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
