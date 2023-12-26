import 'package:flutter/material.dart';

class SignalApp extends StatefulWidget {
  const SignalApp({super.key});

  @override
  State<SignalApp> createState() => _SignalAppState();
}

class _SignalAppState extends State<SignalApp> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Kết nối sẵn sàng',
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          color: Colors.green,
        ),
      ),
    );
  }
}
