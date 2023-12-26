import 'package:flutter/material.dart';

class SelectTypeCallWidget extends StatefulWidget {
  const SelectTypeCallWidget({super.key});

  @override
  State<SelectTypeCallWidget> createState() => _SelectTypeCallWidgetState();
}

const List<String> typeCall = <String>[
  'Tất cả',
  'Gọi đến',
  'Gọi đi',
  'Gọi nhỡ',
];

class _SelectTypeCallWidgetState extends State<SelectTypeCallWidget> {
  String dropdownValue1 = typeCall.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      // width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(width: 0.3),
      ),
      child: DropdownButton(
        focusColor: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        items: typeCall
            .map((value) => DropdownMenuItem(
                  value: value,
                  child: Text(value),
                ))
            .toList(),
        value: dropdownValue1,
        onChanged: (value) {
          setState(() {
            dropdownValue1 = value!;
          });
        },
      ),
    );
  }
}
