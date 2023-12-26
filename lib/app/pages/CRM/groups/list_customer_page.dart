import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/widgets/crm/groups/info_customer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListCustomerPage extends StatefulWidget {
  const ListCustomerPage({super.key});

  @override
  State<ListCustomerPage> createState() => _ListCustomerPageState();
}

class _ListCustomerPageState extends State<ListCustomerPage> {
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
                'Danh sách thành viên',
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
            // padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
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
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        // Navigator.of(context, rootNavigator: true).pop();
                        // context.go('/feature/crm/detail/kjahdf');
                      },
                      child: const InfoCustomerWidget()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
