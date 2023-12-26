import 'package:app_vbot/app/widgets/contacts/info_contact_widget.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          'Danh bạ',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                for (int i = 0; i < 10; i++) ...[
                  const Row(
                    children: [
                      Expanded(child: InfoContactWidget()),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(child: InfoContactWidget()),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(child: InfoContactWidget()),
                    ],
                  )
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
