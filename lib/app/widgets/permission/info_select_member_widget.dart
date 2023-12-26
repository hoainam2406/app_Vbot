import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/material.dart';

class InfoSelectMemberWidget extends StatefulWidget {
  const InfoSelectMemberWidget({super.key});

  @override
  State<InfoSelectMemberWidget> createState() => _InfoSelectMemberWidgetState();
}

class _InfoSelectMemberWidgetState extends State<InfoSelectMemberWidget> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: .3, color: borderColor))),
      child: VPMTextButton(
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
          setState(() {
            checked = !checked;
          });
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              // Checkbox(
              //   activeColor: Colors.green.shade500,
              //   side: const BorderSide(width: .5),
              //   value: checked,
              //   onChanged: (value) {
              //     setState(() {
              //       checked = value!;
              //     });
              //   },
              // ),
              // const SizedBox(
              //   width: 12,
              // ),
              // Container(
              //   width: 35,
              //   height: 35,
              //   decoration: BoxDecoration(
              //     color: Colors.green,
              //     borderRadius: BorderRadius.circular(25),
              //   ),
              //   alignment: Alignment.center,
              //   child: const Text(
              //     'HN',
              //     style: TextStyle(
              //         fontSize: 10,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.white70),
              //   ),
              // ),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: const Image(
                  image: AssetImage('assets/image/avatar.jpg'),
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hoàng Võ Hoài Nam ',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                    RichText(
                      overflow: TextOverflow.ellipsis,
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Vbot ID: ',
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text: 'hoainam123',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Checkbox(
                activeColor: Colors.green.shade500,
                side: const BorderSide(width: .5),
                value: checked,
                onChanged: (value) {
                  setState(() {
                    checked = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
