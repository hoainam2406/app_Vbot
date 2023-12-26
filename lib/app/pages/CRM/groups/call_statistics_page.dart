import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/components/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CallStatisticsPage extends StatefulWidget {
  const CallStatisticsPage({super.key});

  @override
  State<CallStatisticsPage> createState() => _CallStatisticsPageState();
}

class _CallStatisticsPageState extends State<CallStatisticsPage> {
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );

    if (picked != null) {
      _dateController.text = picked.toString().split(" ")[0];
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
                'Thống kê cuộc gọi',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox()
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Column(
            children: [
              CardVPM(
                child: Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Từ: '),
                        const SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: 160,
                          child: TextField(
                            controller: _dateController,
                            // decoration: const InputDecoration(
                            //   border: OutlineInputBorder(
                            //     borderRadius: BorderRadius.all(
                            //       Radius.circular(12),
                            //     ),
                            //   ),
                            //   filled: true,
                            //   prefixIcon: Icon(Icons.calendar_month_sharp),
                            // ),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                borderSide: BorderSide(
                                  width: .3,
                                  color: Color(0xFFABABAB),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: .3,
                                  color: Color(0xFFABABAB),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              contentPadding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                              prefixIcon: Icon(
                                Icons.calendar_month_sharp,
                                size: 20,
                              ),
                            ),
                            readOnly: true,
                            onTap: () {
                              _selectDate();
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Đến: '),
                        const SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: 160,
                          child: TextField(
                            controller: _dateController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                borderSide: BorderSide(
                                  width: .3,
                                  color: Color(0xFFABABAB),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: .3,
                                  color: Color(0xFFABABAB),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              contentPadding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                              prefixIcon: Icon(
                                Icons.calendar_month_sharp,
                                size: 20,
                              ),
                            ),
                            readOnly: true,
                            onTap: () {
                              _selectDate();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardVPM(
                    child: SizedBox(
                      width: 185,
                      child: Column(
                        children: [
                          Text(
                            'Tổng',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '10',
                          )
                        ],
                      ),
                    ),
                  ),
                  CardVPM(
                    child: SizedBox(
                      width: 185,
                      child: Column(
                        children: [
                          Text(
                            'Gọi đến',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.green),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '10',
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardVPM(
                    child: SizedBox(
                      width: 185,
                      child: Column(
                        children: [
                          Text(
                            'Gọi đi',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.blue),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '10',
                          )
                        ],
                      ),
                    ),
                  ),
                  CardVPM(
                    child: SizedBox(
                      width: 185,
                      child: Column(
                        children: [
                          Text(
                            'Gọi nhỡ',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, color: Colors.red),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '10',
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
