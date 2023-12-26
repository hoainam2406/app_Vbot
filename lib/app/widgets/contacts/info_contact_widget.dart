import 'package:app_vbot/app/components/card.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/material.dart';

class InfoContactWidget extends StatefulWidget {
  const InfoContactWidget({super.key});

  @override
  State<InfoContactWidget> createState() => _InfoContactWidgetState();
}

class _InfoContactWidgetState extends State<InfoContactWidget> {
  @override
  Widget build(BuildContext context) {
    return CardVPM(
      padding: const EdgeInsets.all(0),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 300,
        // height: 120,
        decoration: BoxDecoration(
          border: Border.all(
            width: .1,
            color: contactColor,
          ),
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFFF0F0F0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color: const Color(0x4B949492),
                      color: Colors.green),
                  alignment: Alignment.center,
                  child: const Text(
                    'HN',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Hoai Nam',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      '0395001595',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'gọi điện',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
