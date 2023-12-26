import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonFilterWidget extends StatefulWidget {
  const ButtonFilterWidget({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  State<ButtonFilterWidget> createState() => _ButtonFilterWidgetState();
}

class _ButtonFilterWidgetState extends State<ButtonFilterWidget> {
  bool handle = false;
  @override
  Widget build(BuildContext context) {
    return VPMOutlinedButton(
      padding: const EdgeInsets.all(8),
      onPressed: () {
        widget.onPressed.call();
        handle = !handle;
        setState(() {});
      },
      child: Row(
        children: [
          const Text(
            'Lọc nhiều',
            style: TextStyle(color: Colors.black),
          ),
          const SizedBox(
            width: 8,
          ),
          !handle
              ? const Icon(
                  CupertinoIcons.chevron_down,
                  size: 16,
                )
              : const Icon(
                  CupertinoIcons.chevron_up,
                  size: 16,
                ),
        ],
      ),
    );
  }
}
