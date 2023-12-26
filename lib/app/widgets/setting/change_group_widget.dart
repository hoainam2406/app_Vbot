import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangeGroupWidget extends StatefulWidget {
  const ChangeGroupWidget({super.key});

  @override
  State<ChangeGroupWidget> createState() => _ChangeGroupWidgetState();
}

class _ChangeGroupWidgetState extends State<ChangeGroupWidget> {
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
                'Danh sách nhóm',
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
                for (int i = 1; i < 15; i++)
                  VPMTextButton(
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
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: .3, color: borderColor),
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(12)),
                            child: const Text('HN'),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Nhóm $i',
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
