import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/components/card.dart';
import 'package:app_vbot/app/widgets/crm/status/select_color_status_widget.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateStatusCustomerPage extends StatefulWidget {
  const UpdateStatusCustomerPage({super.key});

  @override
  State<UpdateStatusCustomerPage> createState() =>
      _UpdateStatusCustomerPageState();
}

class _UpdateStatusCustomerPageState extends State<UpdateStatusCustomerPage> {
  Widget _nameStatus() {
    return CardVbot(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            textAlign: TextAlign.right,
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Tên ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black)),
                TextSpan(
                    text: '*',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: .3,
                  color: Color(0xFFABABAB),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _codeStatus() {
    return const CardVbot(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mã',
            style: TextStyle(fontWeight: FontWeight.w600),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: 8,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: .3,
                  color: Color(0xFFABABAB),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _colorStatus() {
    return const CardVbot(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Màu',
            style: TextStyle(fontWeight: FontWeight.w600),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: 8,
          ),
          SelectColorStatusWidget(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 450,
      // height: 480,
      child: Column(
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
                  'Cập nhật trạng thái',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const SizedBox()
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _nameStatus(),
                const SizedBox(
                  height: 12,
                ),
                _codeStatus(),
                const SizedBox(
                  height: 12,
                ),
                _colorStatus(),
                const SizedBox(
                  height: 16,
                ),
                VPMOutlinedButtonDelete2(
                  child: Container(
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    child: const Text(
                      'Xóa',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                  onPressed: () {
                    deleteDialog(
                        context: context,
                        description: 'Xóa trạng thái thành viên');
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
