import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/pages/CRM/status/update_status_customer_page.dart';
import 'package:app_vbot/app/widgets/crm/status/info_status_customer_widget.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusCustomerPage extends StatefulWidget {
  const StatusCustomerPage({super.key});

  @override
  State<StatusCustomerPage> createState() => _StatusCustomerPageState();
}

class _StatusCustomerPageState extends State<StatusCustomerPage> {
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
                'Trạng thái khách hàng',
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
                for (int i = 0; i < 10; i++)
                  VPMTextButton(
                      onPressed: () {
                        showAppDialog(
                            child: const UpdateStatusCustomerPage(),
                            context: context);
                      },
                      child: const InfoStatusCustomerWidget())
              ],
            ),
          ),
        )
      ],
    );
  }
}
