import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/components/card.dart';
import 'package:app_vbot/app/components/component.dart';
import 'package:app_vbot/app/pages/members/group/select_member_page.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateGroupMemberPage extends StatefulWidget {
  const UpdateGroupMemberPage({super.key});

  @override
  State<UpdateGroupMemberPage> createState() => _UpdateGroupMemberPageState();
}

class _UpdateGroupMemberPageState extends State<UpdateGroupMemberPage> {
  Widget nameGroup() {
    return CardVPM(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Tên nhóm', style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: '*',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: .3,
                    color: Color(0xFFABABAB),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget descriptionGroup() {
    return const CardVPM(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mô tả nhóm'),
          SizedBox(
            height: 8,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              // contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: .3,
                  color: Color(0xFFABABAB),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
            ),
            minLines: 5,
            maxLines: 5,
          ),
        ],
      ),
    );
  }

  Widget extensionNumber() {
    return CardVPM(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Số máy lẻ nhóm',
                    style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: '*',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: .3,
                    color: Color(0xFFABABAB),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget member() {
    return CardVPM(
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Thành viên',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              VPMIconButton(
                icon: const Icon(
                  CupertinoIcons.add_circled,
                  size: 20,
                ),
                onPressed: () {
                  showAppDialog(
                      child: const SelectMemberPage(), context: context);
                },
              )

              // ButtonVBot(
              //     onPressed: () {
              //       showAppDialog(
              //           child: const SelectMemberPage(), context: context);
              //     },
              //     child: const Icon(Icons.add))
            ],
          ),
          // const SizedBox(
          //   height: 8,
          // ),
          for (int i = 0; i < 5; i++)
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: .3),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(50)),
                    alignment: Alignment.center,
                    child: const Text(
                      'HN',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hoàng Võ Hoài Nam',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      RichText(
                        textAlign: TextAlign.left,
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'VBot ID: ',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            TextSpan(
                                text: 'hoainam07 ',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
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
                'Sửa nhóm thành viên',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
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
              child: Wrap(
                // crossAxisAlignment: CrossAxisAlignment.start,
                runSpacing: 12,
                children: [
                  nameGroup(),
                  descriptionGroup(),
                  extensionNumber(),
                  member(),
                  VPMOutlinedButtonAdd2(
                    child: const SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        'Lưu',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
