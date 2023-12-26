import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoSelectPermissionWidget extends StatefulWidget {
  const InfoSelectPermissionWidget({super.key, required this.content});
  final String content;

  @override
  State<InfoSelectPermissionWidget> createState() =>
      _InfoSelectPermissionWidgetState();
}

class _InfoSelectPermissionWidgetState
    extends State<InfoSelectPermissionWidget> {
  bool checked = false;
  String get content => widget.content;
  @override
  Widget build(BuildContext context) {
    return VPMTextButton(
      onPressed: () {
        checked = !checked;
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Checkbox(
              activeColor: Colors.green.shade500,
              side: const BorderSide(width: .5),
              value: checked,
              onChanged: (value) {
                setState(() {
                  checked = value!;
                });
              },
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              content,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}
