import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/components/card.dart';
import 'package:app_vbot/app/components/component.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:app_vbot/app/widgets/permission/add_permission_widget.dart';
import 'package:app_vbot/app/widgets/permission/checked_permission_widget.dart';
import 'package:app_vbot/app/widgets/permission/info_member_dialog_widget.dart';
import 'package:app_vbot/app/widgets/permission/select_member_widget.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddGroupPermission extends StatefulWidget {
  const AddGroupPermission({super.key});

  @override
  State<AddGroupPermission> createState() => _AddGroupPermissionState();
}

class _AddGroupPermissionState extends State<AddGroupPermission> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VPMIconButton(
                icon: const Icon(
                  CupertinoIcons.back,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                tooltip: 'Quay lại',
              ),
              const Text(
                'Thêm nhóm quyền',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox()
            ],
          ),
        ),
        const Divider(
          height: 1,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardVbot(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textAlign: TextAlign.right,
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Tên ',
                                  style: TextStyle(color: Colors.black)),
                              TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  top: 0, bottom: 0, left: 8, right: 26),
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                borderSide: BorderSide(
                                  width: .5,
                                  color: borderColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: .5,
                                  color: borderColor,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CardVbot(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Mô tả'),
                        const SizedBox(
                          height: 8,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            // contentPadding: const EdgeInsets.only(
                            //     top: 0, bottom: 0, left: 8, right: 26),
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                              borderSide: BorderSide(
                                width: .5,
                                color: borderColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: .5,
                                color: borderColor,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                          ),
                          minLines: 3,
                          maxLines: 5,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CardVbot(
                    padding: EdgeInsets.zero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                          child: Row(
                            children: [
                              const Text(
                                'Thành viên áp dụng',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              const Spacer(),
                              // IconButton(
                              //   splashRadius: 16,
                              //   onPressed: () {
                              //     showAppDialog(
                              //         child: const SelectMemberWidget(),
                              //         context: context);
                              //   },
                              //   icon: const Icon(
                              //     CupertinoIcons.add_circled,
                              //     size: 20,
                              //   ),
                              // ),

                              VPMIconButton(
                                icon: const Icon(
                                  CupertinoIcons.add_circled,
                                  size: 20,
                                ),
                                onPressed: () {
                                  showAppDialog(
                                      child: const SelectMemberWidget(),
                                      context: context);
                                },
                              )

                              // ButtonVBot(
                              //     onPressed: () {
                              //       showAppDialog(
                              //         child: const SelectMemberWidget(),
                              //         context: context,
                              //       );
                              //     },
                              //     child: const Icon(Icons.add))
                            ],
                          ),
                        ),
                        Column(
                          // runSpacing: 0,
                          children: [
                            for (int i = 0; i < 5; i++)
                              const InfoMemberDialogWodget(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CardVbot(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                          child: Row(
                            children: [
                              const Text(
                                'Quyền quản lý',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              const Spacer(),
                              // IconButton(
                              //   splashRadius: 16,
                              //   onPressed: () {
                              //     showAppDialog(
                              //         child: const AddPermissionWidget(),
                              //         context: context);
                              //   },
                              //   icon: const Icon(
                              //     CupertinoIcons.add_circled,
                              //     size: 20,
                              //   ),
                              // ),

                              VPMIconButton(
                                icon: const Icon(
                                  CupertinoIcons.add_circled,
                                  size: 20,
                                ),
                                onPressed: () {
                                  showAppDialog(
                                      child: const AddPermissionWidget(),
                                      context: context);
                                },
                              )

                              // ButtonVBot(
                              //     onPressed: () {
                              //       showAppDialog(
                              //         child: const AddPermissionWidget(),
                              //         context: context,
                              //       );
                              //     },
                              //     child: const Icon(Icons.add))
                            ],
                          ),
                        ),
                        const Divider(
                          height: 1,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Wrap(
                          runSpacing: 12,
                          children: [
                            for (int i = 0; i < 3; i++) const CheckPermission(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: .3,
                color: borderColor,
              ),
            ),
          ),
          padding: const EdgeInsets.all(8.0),
          child: VPMOutlinedButtonAdd2(
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: const Text(
                'Xác nhận',
                style: TextStyle(color: Colors.white),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
