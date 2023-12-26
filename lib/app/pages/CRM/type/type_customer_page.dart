import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/pages/CRM/type/update_type_customer_page.dart';
import 'package:app_vbot/app/widgets/crm/status/info_status_customer_widget.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TypeCustomerPage extends StatefulWidget {
  const TypeCustomerPage({super.key});

  @override
  State<TypeCustomerPage> createState() => _TypeCustomerPageState();
}

class _TypeCustomerPageState extends State<TypeCustomerPage> {
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
                'Kiểu khách hàng',
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
                            child: const UpdateTypeCustomerPage(),
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
