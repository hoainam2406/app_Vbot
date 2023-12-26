import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/components/card.dart';
import 'package:app_vbot/app/pages/members/group/update_group_member_page.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupMemeberDetailPage extends StatefulWidget {
  const GroupMemeberDetailPage({super.key, required this.content});
  final String content;

  @override
  State<GroupMemeberDetailPage> createState() => _GroupMemeberDetailPageState();
}

class _GroupMemeberDetailPageState extends State<GroupMemeberDetailPage> {
  Widget nameGroup() {
    return CardVPM(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: const Text(
                'HN',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
            ),
            const Text(
              'Hoài Nam',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget descriptionGroup() {
    return const CardVPM(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mô tả nhóm',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'CFC Dragon cần đi khách ngày thứ năm (16/11) khung từ 20h30 - 21h quanh khu vực Nguyễn Xiển. Đội nào chưa có đối liên hệ mình nhá. Cam kết không ctm.',
          ),
        ],
      ),
    );
  }

  Widget extensionNumber() {
    return CardVPM(
      child: SizedBox(
        width: double.infinity,
        child: RichText(
          textAlign: TextAlign.left,
          text: const TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'Số máy lẻ: ',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              TextSpan(text: '1234 ', style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }

  Widget memberAdded() {
    return CardVPM(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Thành viên đã thêm',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          for (int i = 0; i < 5; i++)
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: .3),
                ),
              ),
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12)),
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
                              style: TextStyle(color: Colors.black),
                            ),
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
                'Chi tiết nhóm',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              VPMOutlinedButtonAdd2(
                child: const Text(
                  'Sửa',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
                onPressed: () {
                  showAppDialog(
                      child: const UpdateGroupMemberPage(), context: context);
                },
              )
            ],
          ),
        ),
        const Divider(
          height: 1,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Wrap(
                runSpacing: 12,
                children: [
                  nameGroup(),
                  descriptionGroup(),
                  extensionNumber(),
                  memberAdded(),
                  VPMOutlinedButtonDelete2(
                    child: const SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        'Xóa nhóm',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onPressed: () {
                      deleteDialog(
                          context: context,
                          description: 'Xóa nhóm thành viên Hoài Nam');
                    },
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
