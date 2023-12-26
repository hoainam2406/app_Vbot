import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/components/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPhoneWidget extends StatelessWidget {
  const CardPhoneWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: CardVbot(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CardVbot(
              padding: const EdgeInsets.all(0),
              child: Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(index.toString())),
            ),
            const SizedBox(
              width: 8,
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              '0395001595',
              style: TextStyle(fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            const SizedBox(
              height: 4,
            ),
            const Spacer(),
            SizedBox(
              width: 30,
              child: VPMOutlinedButton(
                onPressed: () {},
                padding: const EdgeInsets.all(0),
                child: const Icon(
                  CupertinoIcons.phone_fill,
                  size: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
