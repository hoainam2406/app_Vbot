import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/pages/members/member/add_hotline_manage_page.dart';
import 'package:app_vbot/app/pages/members/member/extension_number_page.dart';
import 'package:app_vbot/app/pages/members/member/group_account_page.dart';
import 'package:app_vbot/app/pages/members/member/limit_time_call_page.dart';
import 'package:app_vbot/app/pages/members/member/select_memberSIP_page.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:app_vbot/app/widgets/members/box_hotline_manage_widget.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoMemberWidget extends StatelessWidget {
  const InfoMemberWidget(
      {super.key, required this.admin, required this.length});
  final bool admin;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .3, color: borderColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 9,
            child: Row(
              children: [
                // Container(
                //   width: 35,
                //   height: 35,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20),
                //       color: Colors.green),
                //   alignment: Alignment.center,
                //   child: const Text(
                //     'HN',
                //     style: TextStyle(
                //         fontWeight: FontWeight.w600, color: Colors.black),
                //   ),
                // ),
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: const Image(
                    image: AssetImage('assets/image/avatar.jpg'),
                    fit: BoxFit.cover,
                    width: 35,
                    height: 35,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  'Hoai Nam',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            flex: 5,
            child: Text(
              'hoainam',
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
          // Expanded(
          //   flex: 3,
          //   child: Text(
          //     '0395001595',
          //     textAlign: TextAlign.left,
          //     style: TextStyle(fontSize: 16, color: borderColor),
          //   ),
          // ),
          // const SizedBox(
          //   width: 12,
          // ),
          Expanded(
            flex: 4,
            child: admin
                ? const Text(
                    'Quản trị viên',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : Text(
                    'Thành viên',
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
            flex: 4,
            child: Text(
              '10.000.000',
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
            flex: 4,
            child: Text(
              '1234',
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
              flex: 10,
              child: BoxHotlineManageWidget(
                length: length,
              )),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                        alignmentOffset: const Offset(-165, -40),
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
                          MenuItemButton(
                            child: const Text(
                              'Tài khoản',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            onPressed: () {
                              showAppDialog(
                                child: const GroupAccountPage(),
                                context: context,
                              );
                            },
                          ),
                          MenuItemButton(
                            child: const Text(
                              'Giới hạn thời gian gọi',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            onPressed: () {
                              showAppDialog(
                                child: const LimitTimeCallPage(),
                                context: context,
                              );
                            },
                          ),
                          MenuItemButton(
                            child: const Text(
                              'Số máy lẻ',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            onPressed: () {
                              showAppDialog(
                                child: const ExtensionNumberPage(),
                                context: context,
                              );
                            },
                          ),
                          MenuItemButton(
                            child: const Text(
                              'Thêm hotline',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            onPressed: () {
                              showAppDialog(
                                child: const AddHotlineManagePage(),
                                context: context,
                              );
                            },
                          ),
                          MenuItemButton(
                            child: const Text(
                              'Thêm tài khoản thiết bị',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            onPressed: () {
                              showAppDialog(
                                child: const SelectMemberSIPPage(),
                                context: context,
                              );
                            },
                          ),
                          const Divider(
                            thickness: 1,
                            height: 1,
                          ),
                          MenuItemButton(
                            child: const Text(
                              'Xóa thành viên',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.normal,
                              ),
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
