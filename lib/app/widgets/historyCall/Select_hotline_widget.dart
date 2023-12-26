import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectHotlineWidget extends StatefulWidget {
  const SelectHotlineWidget({super.key});

  @override
  State<SelectHotlineWidget> createState() => _SelectHotlineWidgetState();
}

class _SelectHotlineWidgetState extends State<SelectHotlineWidget> {
  String clicked = 'OK1';
  @override
  Widget build(BuildContext context) {
    return MenuBar(
      style: MenuStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          padding: const MaterialStatePropertyAll(
            EdgeInsets.all(0),
          )),
      children: [
        SubmenuButton(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          )),
          menuChildren: [
            MenuItemButton(
              onPressed: () {
                setState(() {
                  clicked = 'Ok1';
                });
              },
              child: const MenuAcceleratorLabel('Ok1'),
            ),
            MenuItemButton(
              onPressed: () {
                setState(() {
                  clicked = 'Ok2';
                });
              },
              child: const MenuAcceleratorLabel('Ok2'),
            ),
            MenuItemButton(
              onPressed: () {
                setState(() {
                  clicked = 'Ok3';
                });
              },
              child: const MenuAcceleratorLabel('Ok3'),
            ),
            MenuItemButton(
              onPressed: () {
                setState(() {
                  clicked = 'Ok4';
                });
              },
              child: const SizedBox(
                  width: 135, child: MenuAcceleratorLabel('Ok4')),
            ),
          ],
          child: Row(
            children: [
              SizedBox(width: 100, child: Text(clicked)),
              const SizedBox(
                width: 12,
              ),
              const Icon(
                CupertinoIcons.chevron_down,
                size: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class DropdownMenuVPM extends StatefulWidget {
  const DropdownMenuVPM({super.key});

  @override
  State<DropdownMenuVPM> createState() => _DropdownMenuVPMState();
}

class _DropdownMenuVPMState extends State<DropdownMenuVPM> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list.first,
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      menuHeight: 200,
      menuStyle: const MenuStyle(
          padding: MaterialStatePropertyAll(
        EdgeInsets.all(0),
      )),
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
