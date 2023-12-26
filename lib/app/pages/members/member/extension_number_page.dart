import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/components/card.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExtensionNumberPage extends StatefulWidget {
  const ExtensionNumberPage({super.key});

  @override
  State<ExtensionNumberPage> createState() => _ExtensionNumberPageState();
}

class _ExtensionNumberPageState extends State<ExtensionNumberPage> {
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
                'Cập nhật số máy lẻ',
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
                CardVbot(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Số máy lẻ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 40,
                        child: TextField(
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
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'Thành viên được gắn số máy lẻ này sẽ nhận được cuộc gọi khi khách hàng bấm số máy lẻ trên bàn phím điện thoại hoặc nhận được chuyển tiếp các cuộc gọi khi các thành viên khác chuyển sang',
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
          ),
        ),
      ],
    );
  }
}
