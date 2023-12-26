import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/components/card.dart';
import 'package:app_vbot/app/components/component.dart';
import 'package:app_vbot/app/widgets/historyCall/select_type_call_widget.dart';
import 'package:app_vbot/app/widgets/historyCall/select_type_call_widget2.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryCallVBotPage extends StatefulWidget {
  const HistoryCallVBotPage({super.key});

  @override
  State<HistoryCallVBotPage> createState() => _HistoryCallVBotPageState();
}

class _HistoryCallVBotPageState extends State<HistoryCallVBotPage> {
  Widget _typeCall() {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Loại',
          textAlign: TextAlign.right,
        ),
        SizedBox(
          width: 8,
        ),
        SelectTypeCallWidget2(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   appBar: AppBar(
        //     title: const Text(
        //       'Lịch sử gọi VBot',
        //       style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        //     ),
        //   ),
        // );

        Column(
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
                'Lịch sử gọi VBot',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox()
            ],
          ),
        ),
        const Divider(
          height: 1,
        ),
        // const LinearProgressIndicator(),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: CardVbot(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ButtonRefreshVBot(onPressed: () {}),
                const SizedBox(
                  width: 12,
                ),
                _typeCall()
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 1; i < 15; i++)
                  Container(
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Icon(
                                    Icons.phone,
                                    size: 16,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  'Hoài Nam',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                )
                              ],
                            ),
                            const Row(
                              children: [
                                Text('VBot - 11:48:57 12/1/2023'),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
