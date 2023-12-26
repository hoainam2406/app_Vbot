import 'package:flutter/material.dart';

class InfoStatusCustomerWidget extends StatefulWidget {
  const InfoStatusCustomerWidget({super.key});

  @override
  State<InfoStatusCustomerWidget> createState() =>
      _InfoStatusCustomerWidgetState();
}

class _InfoStatusCustomerWidgetState extends State<InfoStatusCustomerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: .3),
          // bottom: BorderSide(width: .3),
        ),
      ),
      width: double.maxFinite,
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(width: .3),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: const Text(
              'HN',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.black),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hoài Nam',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black)),
              Text(
                '10 khách hàng',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
