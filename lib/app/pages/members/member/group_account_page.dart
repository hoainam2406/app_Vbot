import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/components/card.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupAccountPage extends StatefulWidget {
  const GroupAccountPage({super.key});

  @override
  State<GroupAccountPage> createState() => _GroupAccountPageState();
}

class _GroupAccountPageState extends State<GroupAccountPage> {
  final TextEditingController _textController = TextEditingController(text: '');
  void validateInput(String text) {
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
          } else if (allowChars.isEmpty && element == '-') {
            allowChars.add(element);
          }
        }
      }

      String allowStr = allowChars.join();
      _textController.text = allowStr;
      _textController.selection =
          TextSelection.collapsed(offset: _textController.text.length);
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
                'Tài khoản nhóm',
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
              // Text('Tài khoản nhóm: 6000 đ'),
              CardVbot(
                child: SizedBox(
                  width: double.infinity,
                  child: RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Tài khoản nhóm: ',
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: '6000 đ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              CardVbot(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Cộng trừ số tiền',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 40,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Container(
                            // color: Colors.red,
                            alignment: Alignment.center,
                            width: 27,
                            // padding: const EdgeInsets.only(right: 8, bottom: 4),
                            child: const Row(
                              children: [
                                SizedBox(
                                    height: 30,
                                    child: VerticalDivider(
                                      width: 10,
                                    )),
                                Text(
                                  'đ',
                                ),
                              ],
                            ),
                          ),
                          TextField(
                            onChanged: (value) {
                              validateInput(value);
                            },
                            controller: _textController,
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
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      'Thêm dấu "-" trước số tiền để giảm số tiền',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ],
                ),
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
        ))
      ],
    );
  }
}
