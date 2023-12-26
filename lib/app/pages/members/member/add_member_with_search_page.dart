import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/components/card.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMemberWithSearchPage extends StatefulWidget {
  const AddMemberWithSearchPage({super.key});

  @override
  State<AddMemberWithSearchPage> createState() =>
      _AddMemberWithSearchPageState();
}

class _AddMemberWithSearchPageState extends State<AddMemberWithSearchPage> {
  Widget joinGroup() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: CardVbot(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'HN',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hoàng Võ Hoài Nam',
                        style: TextStyle(fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Vbot ID: ',
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                                text: 'hoainam123',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // const Spacer(),
                // VPMIconButton(
                //   icon: const Icon(CupertinoIcons.person_add),
                //   onPressed: () {},
                // )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 50,
                ),
                VPMOutlinedButtonAdd2(
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    'Chấp nhận',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 12,
                ),
                VPMOutlinedButtonDelete2(
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    'Từ chối',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget listSearch() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: CardVbot(
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: const Text(
                'HN',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hoàng Võ Hoài Nam ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Vbot ID: ',
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: 'hoainam123',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            VPMIconButton(
              icon: const Icon(CupertinoIcons.person_add),
              onPressed: () {},
            )
          ],
        ),
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
                'Thêm thành viên',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              const SizedBox()
            ],
          ),
        ),
        const Divider(
          height: 1,
        ),
        Container(
          height: 58,
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
          child: SearchBar(
            shadowColor: const MaterialStatePropertyAll(Colors.transparent),
            side: MaterialStatePropertyAll(
              BorderSide(width: .3, color: borderColor),
            ),
            leading: const Icon(
              CupertinoIcons.search,
              size: 20,
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            hintText: 'Tìm kiếm',
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Yêu cầu tham gia nhóm',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  for (int i = 1; i < 5; i++) joinGroup(),
                ],
              ),
              // const SizedBox(
              //   height: 8,
              // ),
              const Text(
                'Danh sách tìm kiếm',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  for (int i = 1; i < 5; i++) listSearch(),
                ],
              )
            ],
          ),
        ))
      ],
    );
  }
}
