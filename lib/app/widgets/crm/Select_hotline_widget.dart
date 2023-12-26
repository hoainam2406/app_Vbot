import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectHotlineWidget extends StatefulWidget {
  const SelectHotlineWidget({super.key});

  @override
  State<SelectHotlineWidget> createState() => _SelectHotlineWidgetState();
}

const List<String> items = <String>[
  'Tất cả',
  'Nhóm 1',
  'Nhóm 2',
  'Nhóm quản lý khách hàng',
  'Nhóm quản lý khách hàng dài vượt quá vùng chứa dài vượt quá vùng chứa',
];

class _SelectHotlineWidgetState extends State<SelectHotlineWidget> {
  String? selectedValue;
  String clicked = items.first;
  @override
  Widget build(BuildContext context) {
    return MenuBar(
      // style: MenuStyle(
      //   shape: MaterialStatePropertyAll(
      //     RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(12),
      //     ),
      //   ),
      //   padding: const MaterialStatePropertyAll(
      //     EdgeInsets.all(0),
      //   ),
      //   shadowColor: const MaterialStatePropertyAll(Colors.transparent),
      //   side: MaterialStatePropertyAll(
      //     BorderSide(width: .3, color: borderColor),
      //   ),
      // ),
      style: MenuStyle(
          elevation: const MaterialStatePropertyAll<double>(0),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          padding: const MaterialStatePropertyAll(
            EdgeInsets.all(0),
          ),
          shadowColor: const MaterialStatePropertyAll(Colors.transparent),
          side: const MaterialStatePropertyAll(
            BorderSide(
              width: .3,
              color: Color(0xFFABABAB),
            ),
          ),
          backgroundColor: const MaterialStatePropertyAll(Colors.transparent)),
      children: [
        SubmenuButton(
          menuStyle: MenuStyle(
            // backgroundColor: const MaterialStatePropertyAll(Colors.red),
            // shadowColor: const MaterialStatePropertyAll(Colors.transparent),
            // side: MaterialStatePropertyAll(
            //     BorderSide(width: .5, color: borderColor)),

            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          menuChildren: items
              .map(
                (value) => MenuItemButton(
                  onPressed: () {
                    setState(() {
                      clicked = value;
                    });
                  },
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                  child: Tooltip(
                    waitDuration: const Duration(milliseconds: 200),
                    message: value,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.centerLeft,
                      // width: 325,
                      width: 380,
                      height: 40,
                      child: Text(
                        value,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
          child: Row(
            children: [
              Tooltip(
                waitDuration: const Duration(milliseconds: 200),
                message: clicked,
                child: SizedBox(
                  // width: 280,
                  width: 334,
                  child: Text(
                    clicked,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              const Icon(
                CupertinoIcons.chevron_down,
                size: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
