import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoCustomerWidget extends StatefulWidget {
  const InfoCustomerWidget({super.key});

  @override
  State<InfoCustomerWidget> createState() => _InfoCustomerWidgetState();
}

class _InfoCustomerWidgetState extends State<InfoCustomerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .3),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(12)),
            alignment: Alignment.center,
            child: const Text(
              'HN',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hoài Nam',
                style: TextStyle(
                    // fontWeight: FontWeight.w600,
                    // fontSize: 16,
                    color: Colors.black),
              ),
              Text(
                'VBot ID: hoainam07',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.normal),
              ),
              Text('Số máy lẻ: 123',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.normal))
            ],
          ),
        ],
      ),
    );
  }
}
