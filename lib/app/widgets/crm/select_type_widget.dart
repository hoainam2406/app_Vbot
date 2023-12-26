import 'package:app_vbot/constant.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectTypeWidget extends StatefulWidget {
  const SelectTypeWidget({super.key});

  @override
  State<SelectTypeWidget> createState() => _SelectTypeCallWidget2State();
}

const List<String> items = <String>[
  'Tất cả',
  'Cá nhân',
  'Doang nghiệp',
  'Kiểu khách hàng sử dụng sản phẩm',
];

class _SelectTypeCallWidget2State extends State<SelectTypeWidget> {
  String? selectedValue;
  String clicked = items.first;
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   decoration: BoxDecoration(
    //     border: Border.all(width: .3, color: borderColor),
    //     borderRadius: BorderRadius.circular(12),
    //   ),
    //   clipBehavior: Clip.hardEdge,
    //   child: DropdownButtonHideUnderline(
    //     child: DropdownButton2<String>(
    //       isExpanded: true,
    //       hint: Container(
    //         alignment: Alignment.centerLeft,
    //         padding: EdgeInsets.only(left: 12, right: 12),
    //         height: 40,
    //         width: double.infinity,
    //         child: Text(
    //           items.first,
    //           style: TextStyle(
    //               fontSize: 14,
    //               color: Theme.of(context).hintColor,
    //               fontWeight: FontWeight.w600),
    //         ),
    //       ),
    //       items: items
    //           .map(
    //             (String item) => DropdownMenuItem<String>(
    //               value: item,
    //               child: Tooltip(
    //                 message: item,
    //                 waitDuration: const Duration(seconds: 1),
    //                 child: Container(
    //                   alignment: Alignment.centerLeft,
    //                   padding: EdgeInsets.only(left: 12, right: 12),
    //                   height: 40,
    //                   width: double.infinity,
    //                   child: Text(
    //                     item,
    //                     style: const TextStyle(
    //                       fontSize: 14,
    //                       fontWeight: FontWeight.w600,
    //                       color: Colors.black,
    //                     ),
    //                     overflow: TextOverflow.ellipsis,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           )
    //           .toList(),
    //       value: selectedValue,
    //       onChanged: (String? value) {
    //         setState(() {
    //           selectedValue = value;
    //         });
    //       },
    //       buttonStyleData: const ButtonStyleData(
    //         // padding: EdgeInsets.symmetric(horizontal: 12),
    //         height: 32,
    //         width: 200,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.all(
    //             Radius.circular(12),
    //           ),
    //         ),
    //       ),
    //       dropdownStyleData: DropdownStyleData(
    //         decoration: BoxDecoration(
    //           borderRadius: const BorderRadius.all(
    //             Radius.circular(12),
    //           ),
    //           boxShadow: const [
    //             BoxShadow(
    //               color: Colors.transparent,
    //               offset: Offset(10, 10),
    //             ),
    //           ],
    //           border: Border(
    //             top: BorderSide(width: .3, color: borderColor),
    //             bottom: BorderSide(width: .3, color: borderColor),
    //             right: BorderSide(width: .3, color: borderColor),
    //             left: BorderSide(width: .3, color: borderColor),
    //           ),
    //         ),
    //         offset: const Offset(0, -5),
    //         padding: const EdgeInsets.all(0),
    //         maxHeight: 200,
    //       ),
    //       menuItemStyleData: const MenuItemStyleData(
    //         height: 40,
    //         padding: EdgeInsets.only(left: 0, right: 0),
    //       ),
    //       iconStyleData: const IconStyleData(
    //         openMenuIcon: Icon(Icons.keyboard_arrow_up),
    //       ),
    //     ),
    //   ),
    // );

    return Container(
      height: 32,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          border: Border.all(width: .3, color: borderColor),
          borderRadius: BorderRadius.circular(12)),
      child: MenuBar(
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
            backgroundColor:
                const MaterialStatePropertyAll(Colors.transparent)),
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
                        width: 205,
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
                    width: 160,
                    child: Text(
                      clicked,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 13,
                ),
                const Icon(
                  CupertinoIcons.chevron_down,
                  size: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
