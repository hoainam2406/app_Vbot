import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldPasswordWidget extends StatefulWidget {
  const TextFieldPasswordWidget({super.key, required this.onChange});
  final Function(String) onChange;

  @override
  State<TextFieldPasswordWidget> createState() =>
      _TextFieldPasswordWidgetState();
}

class _TextFieldPasswordWidgetState extends State<TextFieldPasswordWidget> {
  Function(String) get onChange => widget.onChange;
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        SizedBox(
          height: 40,
          child: TextField(
            obscureText: showPassword ? false : true,
            // decoration: const InputDecoration(
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(12),
            //       ),
            //     ),
            //     contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0)),

            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                borderSide: BorderSide(
                  width: .3,
                  color: Color(0xFFABABAB),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: .3,
                  color: Color(0xFFABABAB),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              contentPadding: EdgeInsets.fromLTRB(12, 4, 12, 4),
            ),
            onChanged: onChange,
          ),
        ),
        TextButton(
          style: const ButtonStyle(
            overlayColor: MaterialStatePropertyAll(Colors.transparent),
          ),
          onPressed: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
          child: Text(
            showPassword ? 'Ẩn' : 'Hiện',
          ),
        )
      ],
    );
  }
}
