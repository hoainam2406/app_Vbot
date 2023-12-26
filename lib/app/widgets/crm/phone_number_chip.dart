import 'package:app_vbot/constant.dart';
import 'package:flutter/material.dart';

class PhoneNumberChip extends StatelessWidget {
  const PhoneNumberChip(
      {super.key,
      required this.label,
      required this.onDeleted,
      required this.index});
  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        child: Container(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: .3, color: borderColor)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
              ),
              // const SizedBox(
              //   width: 8,
              // ),
              Transform.scale(
                scale: 0.7,
                child: IconButton(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  icon: const Icon(
                    Icons.cancel,
                    // size: 14,
                  ),
                  onPressed: () {
                    onDeleted(index);
                  },
                ),
              ),
            ],
          ),
        )
        // Chip(
        //   label: Text(
        //     '${(index + 1).toString()}. ',
        //   ),
        //   avatar: Row(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       Text(
        //         label,
        //       ),
        //       // const HMinSpace(),
        //       IconButton(
        //           icon: const Icon(
        //             Icons.cancel,
        //             size: 14,
        //           ),
        //           onPressed: () {
        //             onDeleted(index);
        //           })
        //     ],
        //   ),
        // ),
        );
    // return Chip(
    //   labelPadding: const EdgeInsets.only(left: 8.0),
    //   label: Text(label),
    //   deleteIcon: const Icon(
    //     Icons.close,
    //     size: 18,
    //   ),
    //   onDeleted: () {
    //     onDeleted(index);
    //   },
    // );
  }
}
