import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/pages/CRM/otherField/other_field_detail_customer_page.dart';
import 'package:app_vbot/app/widgets/crm/status/info_status_customer_widget.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtherFieldCustomerPage extends StatefulWidget {
  const OtherFieldCustomerPage({super.key});

  @override
  State<OtherFieldCustomerPage> createState() => _OtherFieldCustomerPageState();
}

class _OtherFieldCustomerPageState extends State<OtherFieldCustomerPage> {
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
                'Tùy chỉnh thông tin',
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
                            child: const OtherFieldDetailCustomerPage(),
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
