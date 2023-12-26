import 'package:flutter/cupertino.dart';

class AddCustomerWIdget extends StatefulWidget {
  const AddCustomerWIdget({super.key});

  @override
  State<AddCustomerWIdget> createState() => _AddCustomerWIdgetState();
}

class _AddCustomerWIdgetState extends State<AddCustomerWIdget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 500,
      child: Column(
        children: [Text('Thêm nhóm quyền')],
      ),
    );
  }
}
