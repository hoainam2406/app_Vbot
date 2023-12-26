import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/pages/members/member/limit_time_call_page.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:flutter/material.dart';

class LimitTimeCallWidget extends StatefulWidget {
  const LimitTimeCallWidget({super.key});

  @override
  State<LimitTimeCallWidget> createState() => _LimitTimeCallWidgetState();
}

class _LimitTimeCallWidgetState extends State<LimitTimeCallWidget> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          child: Row(
            children: [
              const Text(
                'Giới hạn thời gian gọi',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const Spacer(),
              SizedBox(
                width: 40,
                height: 10,
                child: Transform.scale(
                  scale: .6,
                  child: Switch(
                    activeColor: Colors.green.shade500,
                    value: checked,
                    onChanged: (bool value) {
                      setState(() {
                        checked = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        VPMOutlinedButton(
          child: SizedBox(
            width: double.maxFinite,
            child: checked
                ? const Text(
                    '0 phút 0 giây',
                    style: TextStyle(color: Colors.black),
                  )
                : const Text(
                    'Không giới hạn thời gian gọi',
                    style: TextStyle(color: Colors.black),
                  ),
          ),
          onPressed: () {
            showAppDialog(child: const LimitTimeCallPage(), context: context);
          },
        ),
      ],
    );
  }
}
