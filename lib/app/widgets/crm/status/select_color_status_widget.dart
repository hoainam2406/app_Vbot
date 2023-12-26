import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectColorStatusWidget extends StatefulWidget {
  const SelectColorStatusWidget({super.key});

  @override
  State<SelectColorStatusWidget> createState() =>
      _SelectColorStatusWidgetState();
}

const List<String> items = <String>[
  '0xFFB3BAC5',
  '0xFF0079BF',
  '0xFF344563',
  '0xFFC377E0',
  '0xFFEB5A46',
  '0xFFFF9F1A',
  '0xFFF2D600',
  '0xFF61BD4F',
];

class _SelectColorStatusWidgetState extends State<SelectColorStatusWidget> {
  String clicked = '0xFFB3BAC5';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          border: Border.all(width: .3, color: borderColor),
          borderRadius: BorderRadius.circular(12)),
      child: MenuBar(
        style: MenuStyle(
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
          backgroundColor: MaterialStatePropertyAll(
            Color(
              int.parse(clicked),
            ),
          ),
        ),
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
            // menuChildren: [
            //   MenuItemButton(
            //     onPressed: () {
            //       setState(() {
            //         clicked = '0xFFB3BAC5';
            //       });
            //     },
            //     // child: const MenuAcceleratorLabel('Ok1'),

            //     style: const ButtonStyle(
            //       padding: MaterialStatePropertyAll(
            //         EdgeInsets.all(0),
            //       ),
            //     ),
            //     child: Container(
            //       width: 200,
            //       height: 40,
            //       alignment: Alignment.centerLeft,
            //       color: const Color(0xFFB3BAC5),

            //       // child: const Text('0xFFB3BAC5'),
            //     ),
            //   ),
            //   MenuItemButton(
            //     onPressed: () {
            //       setState(() {
            //         clicked = '0xFF0079BF';
            //       });
            //     },
            //     // child: const MenuAcceleratorLabel('Ok1'),
            //     style: const ButtonStyle(
            //         padding: MaterialStatePropertyAll(EdgeInsets.all(0))),
            //     child: Container(
            //       width: 200,
            //       height: 40,
            //       alignment: Alignment.centerLeft,
            //       color: const Color(0xFF0079BF),
            //       // child: const Text('0xFF0079BF'),
            //     ),
            //   ),
            //   MenuItemButton(
            //     onPressed: () {
            //       setState(() {
            //         clicked = '0xFF344563';
            //       });
            //     },
            //     // child: const MenuAcceleratorLabel('Ok1'),
            //     style: const ButtonStyle(
            //         padding: MaterialStatePropertyAll(EdgeInsets.all(0))),
            //     child: Container(
            //       width: 200,
            //       height: 40,
            //       alignment: Alignment.centerLeft,
            //       color: const Color(0xFF344563),
            //       // child: const Text('0xFF344563'),
            //     ),
            //   ),
            //   MenuItemButton(
            //     onPressed: () {
            //       setState(() {
            //         clicked = '0xFFC377E0';
            //       });
            //     },
            //     // child: const MenuAcceleratorLabel('Ok1'),
            //     style: const ButtonStyle(
            //         padding: MaterialStatePropertyAll(EdgeInsets.all(0))),
            //     child: Container(
            //       width: 200,
            //       height: 40,
            //       alignment: Alignment.centerLeft,
            //       color: const Color(0xFFC377E0),
            //       // child: const Text('0xFFC377E0'),
            //     ),
            //   ),
            //   MenuItemButton(
            //     onPressed: () {
            //       setState(() {
            //         clicked = '0xFFEB5A46';
            //       });
            //     },
            //     // child: const MenuAcceleratorLabel('Ok1'),
            //     style: const ButtonStyle(
            //         padding: MaterialStatePropertyAll(EdgeInsets.all(0))),
            //     child: Container(
            //       width: 200,
            //       height: 40,
            //       alignment: Alignment.centerLeft,
            //       color: const Color(0xFFEB5A46),
            //       // child: const Text('0xFFEB5A46'),
            //     ),
            //   ),
            //   MenuItemButton(
            //     onPressed: () {
            //       setState(() {
            //         clicked = '0xFFFF9F1A';
            //       });
            //     },
            //     // child: const MenuAcceleratorLabel('Ok1'),
            //     style: const ButtonStyle(
            //         padding: MaterialStatePropertyAll(EdgeInsets.all(0))),
            //     child: Container(
            //       width: 200,
            //       height: 40,
            //       alignment: Alignment.centerLeft,
            //       color: const Color(0xFFFF9F1A),
            //       // child: const Text('0xFFFF9F1A'),
            //     ),
            //   ),
            //   MenuItemButton(
            //     onPressed: () {
            //       setState(() {
            //         clicked = '0xFFF2D600';
            //       });
            //     },
            //     // child: const MenuAcceleratorLabel('Ok1'),
            //     style: const ButtonStyle(
            //         padding: MaterialStatePropertyAll(EdgeInsets.all(0))),
            //     child: Container(
            //       width: 200,
            //       height: 40,
            //       alignment: Alignment.centerLeft,
            //       color: const Color(0xFFF2D600),
            //       // child: const Text('0xFFF2D600'),
            //     ),
            //   ),
            //   MenuItemButton(
            //     onPressed: () {
            //       setState(() {
            //         clicked = '0xFF61BD4F';
            //       });
            //     },
            //     // child: const MenuAcceleratorLabel('Ok1'),
            //     style: const ButtonStyle(
            //         padding: MaterialStatePropertyAll(EdgeInsets.all(0))),
            //     child: Container(
            //       width: 200,
            //       height: 40,
            //       alignment: Alignment.centerLeft,
            //       color: const Color(0xFF61BD4F),
            //       // child: const Text('0xFF61BD4F'),
            //     ),
            //   ),
            // ],

            menuChildren: items
                .map(
                  (value) => SizedBox(
                    height: 32,
                    child: MenuItemButton(
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
                          color: Color(int.parse(value)),
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.centerLeft,
                          width: 86,
                          height: 32,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
            child: const Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Icon(
                  CupertinoIcons.chevron_down,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
