import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingCallPage extends StatefulWidget {
  const SettingCallPage({super.key});

  @override
  State<SettingCallPage> createState() => _SettingCallPageState();
}

class _SettingCallPageState extends State<SettingCallPage> {
  bool micro1 = false;
  bool micro2 = false;
  bool speaker = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(155, 246, 246, 246)),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Cài đặt cuộc gọi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.close,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(65)),
                child: const Image(
                  image: AssetImage('assets/image/avatar.jpg'),
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Tooltip(
                      message: '1111',
                      child: Text(
                        'Hoàng Võ Hoài Nam',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '00:00',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Microphone',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.green.shade500,
                        side: const BorderSide(width: .5),
                        value: micro1,
                        onChanged: (value) {
                          setState(() {
                            micro1 = value!;
                          });
                        },
                      ),
                      const Text(
                        'Microphone (Realtek(R) Audio)',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.green.shade500,
                        side: const BorderSide(width: .5),
                        value: micro2,
                        onChanged: (value) {
                          setState(() {
                            micro2 = value!;
                          });
                        },
                      ),
                      const Text(
                        'Microphone array (Realtek(R) Audio)',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Loa/Tai nghe',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.green.shade500,
                        side: const BorderSide(width: .5),
                        value: speaker,
                        onChanged: (value) {
                          setState(() {
                            speaker = value!;
                          });
                        },
                      ),
                      const Text(
                        'Speakers (Realtek(R) Audio)',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
