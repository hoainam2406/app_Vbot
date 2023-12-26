import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/material.dart';

class AddOtherInfomationWidget extends StatefulWidget {
  const AddOtherInfomationWidget({super.key, required this.name});
  final String name;

  @override
  State<AddOtherInfomationWidget> createState() =>
      _AddOtherInfomationWidgetState();
}

class _AddOtherInfomationWidgetState extends State<AddOtherInfomationWidget> {
  String get name => widget.name;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 310,
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          // const SizedBox(
          //   height: 12,
          // ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                borderSide: BorderSide(
                  width: .5,
                  color: borderColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: .5,
                  color: borderColor,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
            ),
            minLines: 7,
            maxLines: 7,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              VPMOutlinedButtonDelete2(
                child: const Text(
                  'Hủy',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(
                width: 8,
              ),
              VPMOutlinedButtonAdd2(
                child: const Text('Lưu', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
