import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/pages/CRM/groups/group_customer_detail_page.dart';
import 'package:app_vbot/app/widgets/crm/groups/info_group_customer_widget.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupCustomerPage extends StatefulWidget {
  const GroupCustomerPage({super.key});

  @override
  State<GroupCustomerPage> createState() => _GroupCustomerPageState();
}

class _GroupCustomerPageState extends State<GroupCustomerPage> {
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
                'Nhóm khách hàng',
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
            child: Column(
              children: [
                for (int i = 0; i < 5; i++)
                  VPMTextButton(
                      style: ButtonStyle(
                        padding: const MaterialStatePropertyAll(
                          EdgeInsets.all(0),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),

                        foregroundColor: const MaterialStatePropertyAll(
                          Colors.black,
                        ),
                        // iconColor: const MaterialStatePropertyAll(
                        //   Colors.red,
                        // ),
                        // surfaceTintColor: const MaterialStatePropertyAll(
                        //   Colors.red,
                        // ),
                        // overlayColor: const MaterialStatePropertyAll(
                        //   Colors.red,
                        // ),
                      ),
                      onPressed: () {
                        // Navigator.pop(context);
                        showAppDialog(
                            child: const GroupCustomerDetailPage(),
                            context: context);
                      },
                      child: const InfoGroupCustomerWidget()),
              ],
            ),
          ),
        )
      ],
    );
  }
}
