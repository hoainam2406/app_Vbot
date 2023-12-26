import 'package:app_vbot/app/components/button_vpm.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HotlineManageWidget extends StatefulWidget {
  const HotlineManageWidget({super.key});

  @override
  State<HotlineManageWidget> createState() => _HotlineManageWidgetState();
}

class _HotlineManageWidgetState extends State<HotlineManageWidget> {
  bool checked = true;
  bool checked2 = false;

  TimeOfDay? selectedTime;
  TimeOfDay? selectedTime2;
  TimePickerEntryMode entryMode = TimePickerEntryMode.dial;
  Orientation? orientation;
  MaterialTapTargetSize tapTargetSize = MaterialTapTargetSize.padded;
  TextDirection textDirection = TextDirection.ltr;
  bool use24HourTime = false;

  bool? _checkTime(selectedTime, selectedTime2) {
    if (selectedTime != null && selectedTime2 != null) {
      if (selectedTime.hour < selectedTime2.hour) {
        return true;
      } else if (selectedTime.hour == selectedTime2.hour) {
        if (selectedTime.minute < selectedTime2.minute) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: .3),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '0395001595',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              VPMIconButton(
                icon: const Icon(
                  CupertinoIcons.delete,
                ),
                onPressed: () {
                  deleteDialog(context: context, description: 'content');
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Cho phép gọi đi',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Switch(
                activeColor: Colors.green.shade500,
                value: checked,
                onChanged: (bool value) {
                  setState(() {
                    checked = value;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Giới hạn thời gian sử dụng trong ngày',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Switch(
                activeColor: Colors.green.shade500,
                value: checked2,
                onChanged: (bool value) {
                  setState(() {
                    checked2 = value;
                  });
                },
              ),
            ],
          ),
          if (checked2)
            Row(
              children: [
                Expanded(
                  child: VPMOutlinedButton(
                    child: SizedBox(
                      width: double.maxFinite,
                      child: selectedTime != null
                          ? Text(
                              selectedTime!.format(context),
                              style: const TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                            )
                          : const Text(
                              'HH:mm',
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                    ),
                    onPressed: () async {
                      final TimeOfDay? time = await showTimePicker(
                        context: context,
                        initialTime: selectedTime ?? TimeOfDay.now(),
                        initialEntryMode: entryMode,
                        orientation: orientation,
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              materialTapTargetSize: tapTargetSize,
                            ),
                            child: Directionality(
                              textDirection: textDirection,
                              child: MediaQuery(
                                data: MediaQuery.of(context).copyWith(
                                  alwaysUse24HourFormat: use24HourTime,
                                ),
                                child: child!,
                              ),
                            ),
                          );
                        },
                      );
                      setState(
                        () {
                          if (_checkTime(time, selectedTime2) == true) {
                            selectedTime = time;
                          } else {
                            const snackBar = SnackBar(
                              content: Text(
                                  'Thời gian kết thúc phải lớn hơn thời gian bắt đầu'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                const Text(
                  'Đến',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: VPMOutlinedButton(
                    child: SizedBox(
                      width: double.maxFinite,
                      child: selectedTime2 != null
                          ? Text(
                              selectedTime2!.format(context),
                              style: const TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                            )
                          : const Text(
                              'HH:mm',
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                    ),
                    onPressed: () async {
                      final TimeOfDay? time = await showTimePicker(
                        context: context,
                        initialTime: selectedTime2 ?? TimeOfDay.now(),
                        initialEntryMode: entryMode,
                        orientation: orientation,
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              materialTapTargetSize: tapTargetSize,
                            ),
                            child: Directionality(
                              textDirection: textDirection,
                              child: MediaQuery(
                                data: MediaQuery.of(context).copyWith(
                                  alwaysUse24HourFormat: use24HourTime,
                                ),
                                child: child!,
                              ),
                            ),
                          );
                        },
                      );
                      setState(
                        () {
                          if (_checkTime(selectedTime, time) == true) {
                            selectedTime2 = time;
                          } else {
                            const snackBar = SnackBar(
                              content: Text(
                                  'Thời gian kết thúc phải lớn hơn thời gian bắt đầu'),
                              // action: SnackBarAction(
                              //   label: 'Undo',
                              //   onPressed: () {
                              //     // Some code to undo the change.
                              //   },
                              // ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class HotlineManageWidget2 extends StatefulWidget {
  const HotlineManageWidget2({super.key});

  @override
  State<HotlineManageWidget2> createState() => _HotlineManageWidget2State();
}

class _HotlineManageWidget2State extends State<HotlineManageWidget2> {
  bool checked = true;
  bool checked2 = false;

  TimeOfDay? selectedTime;
  TimeOfDay? selectedTime2;
  TimePickerEntryMode entryMode = TimePickerEntryMode.dial;
  Orientation? orientation;
  MaterialTapTargetSize tapTargetSize = MaterialTapTargetSize.padded;
  TextDirection textDirection = TextDirection.ltr;
  bool use24HourTime = false;

  bool? _checkTime(selectedTime, selectedTime2) {
    if (selectedTime != null && selectedTime2 != null) {
      if (selectedTime.hour < selectedTime2.hour) {
        return true;
      } else if (selectedTime.hour == selectedTime2.hour) {
        if (selectedTime.minute < selectedTime2.minute) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(border: Border(top: BorderSide(width: .3))),
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 8, 0, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hotline: 0395001595',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              VPMIconButton(
                icon: const Icon(
                  CupertinoIcons.delete,
                  size: 20,
                ),
                onPressed: () {
                  deleteDialog(context: context, description: 'content');
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Cho phép gọi đi',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Transform.scale(
                scale: .7,
                child: Switch(
                  activeColor: Colors.green.shade500,
                  value: checked,
                  onChanged: (bool value) {
                    setState(() {
                      checked = value;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Giới hạn thời gian sử dụng',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Transform.scale(
                scale: .7,
                child: Switch(
                  activeColor: Colors.green.shade500,
                  value: checked2,
                  onChanged: (bool value) {
                    setState(() {
                      checked2 = value;
                    });
                  },
                ),
              ),
            ],
          ),
          if (checked2)
            Padding(
              padding: const EdgeInsets.only(right: 12, bottom: 12),
              child: Row(
                children: [
                  Expanded(
                    child: VPMOutlinedButton(
                      child: SizedBox(
                        width: double.maxFinite,
                        child: selectedTime != null
                            ? Text(
                                selectedTime!.format(context),
                                style: const TextStyle(color: Colors.black),
                                textAlign: TextAlign.center,
                              )
                            : const Text(
                                'HH:mm',
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                      ),
                      onPressed: () async {
                        final TimeOfDay? time = await showTimePicker(
                          context: context,
                          initialTime: selectedTime ?? TimeOfDay.now(),
                          initialEntryMode: entryMode,
                          orientation: orientation,
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                materialTapTargetSize: tapTargetSize,
                              ),
                              child: Directionality(
                                textDirection: textDirection,
                                child: MediaQuery(
                                  data: MediaQuery.of(context).copyWith(
                                    alwaysUse24HourFormat: use24HourTime,
                                  ),
                                  child: child!,
                                ),
                              ),
                            );
                          },
                        );
                        setState(
                          () {
                            if (_checkTime(time, selectedTime2) == true) {
                              selectedTime = time;
                            } else {
                              const snackBar = SnackBar(
                                content: Text(
                                    'Thời gian kết thúc phải lớn hơn thời gian bắt đầu'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Đến',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: VPMOutlinedButton(
                      child: SizedBox(
                        width: double.maxFinite,
                        child: selectedTime2 != null
                            ? Text(
                                selectedTime2!.format(context),
                                style: const TextStyle(color: Colors.black),
                                textAlign: TextAlign.center,
                              )
                            : const Text(
                                'HH:mm',
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                      ),
                      onPressed: () async {
                        final TimeOfDay? time = await showTimePicker(
                          context: context,
                          initialTime: selectedTime2 ?? TimeOfDay.now(),
                          initialEntryMode: entryMode,
                          orientation: orientation,
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                materialTapTargetSize: tapTargetSize,
                              ),
                              child: Directionality(
                                textDirection: textDirection,
                                child: MediaQuery(
                                  data: MediaQuery.of(context).copyWith(
                                    alwaysUse24HourFormat: use24HourTime,
                                  ),
                                  child: child!,
                                ),
                              ),
                            );
                          },
                        );
                        setState(
                          () {
                            if (_checkTime(selectedTime, time) == true) {
                              selectedTime2 = time;
                            } else {
                              const snackBar = SnackBar(
                                content: Text(
                                    'Thời gian kết thúc phải lớn hơn thời gian bắt đầu'),
                                // action: SnackBarAction(
                                //   label: 'Undo',
                                //   onPressed: () {
                                //     // Some code to undo the change.
                                //   },
                                // ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
