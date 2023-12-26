import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/components/card.dart';
import 'package:app_vbot/app/components/component.dart';
import 'package:app_vbot/app/pages/CRM/groups/add_member_manage_page.dart';
import 'package:app_vbot/app/pages/CRM/groups/call_statistics_page.dart';
import 'package:app_vbot/app/pages/CRM/groups/list_customer_page.dart';
import 'package:app_vbot/app/widgets/crm/groups/info_group_member_manage_widget.dart';
import 'package:app_vbot/app/widgets/crm/groups/info_member_manage_widget.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupCustomerDetailPage extends StatefulWidget {
  const GroupCustomerDetailPage({super.key});

  @override
  State<GroupCustomerDetailPage> createState() =>
      _GroupCustomerDetailPageState();
}

class _GroupCustomerDetailPageState extends State<GroupCustomerDetailPage> {
  String time = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DateTime now = DateTime.now();
    // DateTime date = new DateTime(now.year, now.month, now.day);
    time = '${now.day}/${now.month}/${now.year}';

    // print('Nam log $time');
  }

  Widget nameGroup() {
    return CardVPM(
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(25)),
            child: const Text(
              'HN',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          const Text(
            'Đội em cần đi khách Thứ 4 ( 29/11 ) khung 20h30 ',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget description() {
    return const CardVPM(
      child: Column(
        children: [
          Text(
            'Mô tả nhóm',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            textAlign: TextAlign.left,
          ),
          Text(
            'Để tạo nút tròn có bán kính đường viền trong Flutter, bạn có thể sử dụng tiện ích ElevatedButton hoặc TextButton và đặt thuộc tính hình dạng của nó thành RoundedRectangleBorder với tham số BorderRadius.',
          ),
        ],
      ),
    );
  }

  Widget statistical() {
    return CardVPM(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                textAlign: TextAlign.right,
                text: TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                        text: 'Thống kê ngày ',
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: time,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.black)),
                  ],
                ),
              ),
              VPMTextButton(
                child: const Text('Xem thêm'),
                onPressed: () {
                  showAppDialog(
                      child: const CallStatisticsPage(), context: context);
                },
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'Tổng',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '10',
                  )
                ],
              ),
              SizedBox(width: 10, height: 50, child: VerticalDivider()),
              Column(
                children: [
                  Text(
                    'Gọi đến',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '10',
                  )
                ],
              ),
              SizedBox(width: 10, height: 50, child: VerticalDivider()),
              Column(
                children: [
                  Text(
                    'Gọi đi',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '10',
                  )
                ],
              ),
              SizedBox(width: 10, height: 50, child: VerticalDivider()),
              Column(
                children: [
                  Text(
                    'Gọi nhỡ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '10',
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget listCustomer() {
    return CardVPM(
      padding: EdgeInsets.zero,
      child: VPMTextButton(
        child: const Padding(
          padding: EdgeInsets.fromLTRB(8, 12, 8, 12),
          child: Row(
            children: [
              Icon(
                Icons.person_pin_outlined,
                // color: Colors.black,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'Danh sách khách hàng',
                style: TextStyle(
                  // color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Spacer(),
              Text(
                '2 khách hàng',
                style: TextStyle(
                  // color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Icon(
                Icons.chevron_right,
                // color: Colors.black,
              ),
            ],
          ),
        ),
        onPressed: () {
          // Navigator.pop(context);
          showAppDialog(
            child: const ListCustomerPage(),
            context: context,
          );
        },
      ),
    );
  }

  Widget memberManage() {
    return CardVPM(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Thêm thành viên quản lý',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const Spacer(),
              VPMIconButton(
                icon: const Icon(
                  CupertinoIcons.add_circled,
                  size: 20,
                ),
                onPressed: () {
                  showAppDialog(
                      child: const AddMemberManagePage(), context: context);
                },
              )
              // ButtonVBot(
              //   onPressed: () {
              //     showAppDialog(
              //         child: const AddMemberManagePage(), context: context);
              //   },
              //   child: const Icon(Icons.add),
              // ),
            ],
          ),
          // const SizedBox(
          //   height: 8,
          // ),
          for (int i = 0; i < 5; i++) const InfoMemberManageWidget(),
        ],
      ),
    );
  }

  Widget groupMemberManage() {
    return CardVPM(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Thêm nhóm thành viên quản lý',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const Spacer(),
              VPMIconButton(
                icon: const Icon(
                  CupertinoIcons.add_circled,
                  size: 20,
                ),
                onPressed: () {
                  showAppDialog(
                      child: const AddMemberManagePage(), context: context);
                },
              )
              // ButtonVBot(
              //   onPressed: () {
              //     showAppDialog(
              //         child: const AddMemberManagePage(), context: context);
              //   },
              //   child: const Icon(Icons.add),
              // ),
            ],
          ),
          // const SizedBox(
          //   height: 8,
          // ),
          for (int i = 0; i < 5; i++) const InfoGroupMemberManageWidget(),
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
                'Thông tin chi tiết nhóm',
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
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Wrap(
              runSpacing: 12,
              children: [
                nameGroup(),
                // const Divider(
                //   thickness: 5,
                // ),
                description(),
                // const Divider(
                //   thickness: 5,
                // ),
                statistical(),
                // const Divider(
                //   thickness: 5,
                // ),
                listCustomer(),
                // const Divider(
                //   thickness: 5,
                // ),
                memberManage(),
                // const Divider(
                //   thickness: 5,
                // ),
                groupMemberManage(),
                const SizedBox(
                  height: 8,
                ),
                VPMOutlinedButtonDelete2(
                  child: const SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      'Xóa',
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
      ],
    );
  }
}
