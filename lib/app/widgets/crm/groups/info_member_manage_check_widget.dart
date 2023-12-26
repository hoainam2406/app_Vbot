import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoMemberManageCheckWidget extends StatefulWidget {
  const InfoMemberManageCheckWidget({super.key});

  @override
  State<InfoMemberManageCheckWidget> createState() =>
      _InfoMemberManageCheckWidgetState();
}

class _InfoMemberManageCheckWidgetState
    extends State<InfoMemberManageCheckWidget> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return VPMTextButton(
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
        setState(() {
          checked = !checked;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        // color: Colors.red,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: .3, color: borderColor))),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: const Text(
                'HN',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 150,
                  child: Text(
                    'Hoàng Võ Hoài Nam ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Vbot ID: ',
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: 'hoainam123',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
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
            // VPMIconButton(
            //   icon: const Icon(CupertinoIcons.person_add),
            //   onPressed: () {},
            // )
          ],
        ),
      ),
    );
  }
}
