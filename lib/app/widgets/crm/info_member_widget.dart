import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoMemberWidget extends StatelessWidget {
  const InfoMemberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: .3,
            color: borderColor,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              '00:00:00',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                color: borderColor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          const Expanded(
            flex: 3,
            child: Text(
              'Hoai Nam',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  // fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            flex: 6,
            child: Text(
              '0395001595',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                color: borderColor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            flex: 3,
            child: Text(
              'ok1',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                color: borderColor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            flex: 3,
            child: Text(
              'ok2',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                color: borderColor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            flex: 3,
            child: Text(
              'ok3',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                color: borderColor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  padding: const EdgeInsets.only(left: 0),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: VPMIconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  width: 36,
                  height: 36,
                  padding: const EdgeInsets.only(left: 0),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: MenuBar(
                    style: const MenuStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      elevation: MaterialStatePropertyAll<double>(0),
                      padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      alignment: Alignment.center,
                    ),
                    children: [
                      SubmenuButton(
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        menuStyle: MenuStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        menuChildren: [
                          SubmenuButton(
                            alignmentOffset: const Offset(2, 8),
                            menuStyle: MenuStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                            menuChildren: [
                              MenuItemButton(
                                child: const Text(
                                  'Ngày tạo: 2023-09-11 13:43:09',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                              MenuItemButton(
                                child: const Text(
                                  'Email: nam@gmail.com',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                              MenuItemButton(
                                child: const Text(
                                  'Địa chỉ: Cầu Giấy',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ],
                            child: const Text('Xem thêm'),
                          ),
                          MenuItemButton(
                            child: const Text(
                              'Xóa',
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () {},
                          )
                        ],
                        child: const Icon(
                          CupertinoIcons.ellipsis,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
