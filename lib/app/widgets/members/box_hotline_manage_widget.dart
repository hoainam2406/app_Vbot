import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxHotlineManageWidget extends StatefulWidget {
  const BoxHotlineManageWidget({super.key, required this.length});
  final int length;

  @override
  State<BoxHotlineManageWidget> createState() => _BoxHotlineManageWidgetState();
}

class _BoxHotlineManageWidgetState extends State<BoxHotlineManageWidget> {
  bool widen = false;
  @override
  Widget build(BuildContext context) {
    return widget.length > 2
        ? Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (int i = 0;
                        widen == true ? i < widget.length : i < 2;
                        i++)
                      Container(
                        alignment: Alignment.center,
                        width: 100,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                          color: const Color.fromARGB(255, 240, 240, 240),
                        ),
                        child: Text(
                          '0395001595',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: borderColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              VPMTextButton(
                onPressed: () {
                  widen = !widen;
                  setState(() {});
                },
                child: Icon(
                  widen == false
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up,
                ),
              )
            ],
          )
        : Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (int i = 0; i < widget.length; i++)
                Container(
                  alignment: Alignment.center,
                  width: 100,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                    color: const Color.fromARGB(255, 240, 240, 240),
                  ),
                  child: Text(
                    '0395001595',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: borderColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
            ],
          );
  }
}
