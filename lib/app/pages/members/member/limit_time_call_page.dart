import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/components/card.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LimitTimeCallPage extends StatefulWidget {
  const LimitTimeCallPage({super.key});

  @override
  State<LimitTimeCallPage> createState() => _LimitTimeCallPageState();
}

class _LimitTimeCallPageState extends State<LimitTimeCallPage> {
  final TextEditingController _textControllerSecond =
      TextEditingController(text: '');
  final TextEditingController _textControllerMinute =
      TextEditingController(text: '');
  void validateInputMinute(String text) {
    List allowInputs = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

    if (text.isNotEmpty) {
      List<String> textArr = text.split("");
      List<String> allowChars = [];

      for (var element in textArr) {
        if (allowInputs.contains(element)) {
          allowChars.add(element);
        } else {
          if (allowChars.isNotEmpty && element == '0') {
            allowChars.add(element);
          }
        }
      }

      String allowStr = allowChars.join();
      _textControllerMinute.text = allowStr;
      _textControllerMinute.selection =
          TextSelection.collapsed(offset: _textControllerMinute.text.length);
    }
  }

  void validateInputSecond(String text) {
    List allowInputs = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

    if (text.isNotEmpty) {
      List<String> textArr = text.split("");
      List<String> allowChars = [];

      for (var element in textArr) {
        if (allowInputs.contains(element)) {
          allowChars.add(element);
        } else {
          if (allowChars.isNotEmpty && element == '0') {
            allowChars.add(element);
          }
        }
      }

      String allowStr = allowChars.join();
      _textControllerSecond.text = allowStr;
      _textControllerSecond.selection =
          TextSelection.collapsed(offset: _textControllerSecond.text.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
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
                'Giới hạn thời gian gọi',
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
          child: Container(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CardVbot(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Phút'),
                          const SizedBox(
                            height: 4,
                          ),
                          SizedBox(
                            width: 180,
                            height: 40,
                            child: TextField(
                              onChanged: (value) {
                                validateInputMinute(value);
                              },
                              controller: _textControllerMinute,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    top: 0, bottom: 0, left: 8, right: 26),
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
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    CardVbot(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Giây'),
                          const SizedBox(
                            height: 4,
                          ),
                          SizedBox(
                            width: 180,
                            height: 40,
                            child: TextField(
                              onChanged: (value) {
                                validateInputSecond(value);
                              },
                              controller: _textControllerSecond,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    top: 0, bottom: 0, left: 8, right: 26),
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                VPMOutlinedButtonAdd2(
                  child: const SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      'Xác nhận',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
