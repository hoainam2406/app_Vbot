// AppDialpadPage
import 'package:app_vbot/app/components/card.dart';
import 'package:app_vbot/app/widgets/action_button.dart';
import 'package:app_vbot/app/widgets/historyCall/select_hotline_call_widget.dart';
import 'package:app_vbot/app/widgets/phones/select_hotline_call_phone_widget.dart';
import 'package:app_vbot/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDialpadPage extends StatefulWidget {
  const AppDialpadPage({super.key});

  @override
  State<AppDialpadPage> createState() => _AppDialpadPageState();
}

class _AppDialpadPageState extends State<AppDialpadPage> {
  final TextEditingController _textController = TextEditingController(text: '');

  //

  void validateInput(String text) {
    List allowInputs = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

    if (text.isNotEmpty) {
      List<String> textArr = text.split("");
      List<String> allowChars = [];

      for (var element in textArr) {
        if (allowInputs.contains(element)) {
          allowChars.add(element);
        } else {
          if (allowChars.isEmpty && element == '+') {
            allowChars.add(element);
          }
        }
      }

      String allowStr = allowChars.join();
      _textController.text = allowStr;
      _textController.selection =
          TextSelection.collapsed(offset: _textController.text.length);
    }
  }

  bool _isUtf16Surrogate(int value) {
    return value & 0xF800 == 0xD800;
  }

  void _handleBackSpace([bool deleteAll = false]) {
    if (deleteAll) {
      _textController.text = '';
      return;
    }
    final text = _textController.text;
    final textSelection = _textController.selection;
    final selectionLength = textSelection.end - textSelection.start;

    // There is a selection.
    if (selectionLength > 0) {
      final newText = text.replaceRange(
        textSelection.start,
        textSelection.end,
        '',
      );
      _textController.text = newText;
      _textController.selection = textSelection.copyWith(
        baseOffset: textSelection.start,
        extentOffset: textSelection.start,
      );
      return;
    }

    // The cursor is at the beginning.
    if (textSelection.start == 0) {
      return;
    }

    // Delete the previous character
    final previousCodeUnit = text.codeUnitAt(textSelection.start - 1);
    final offset = _isUtf16Surrogate(previousCodeUnit) ? 2 : 1;
    final newStart = textSelection.start - offset;
    final newEnd = textSelection.start;
    final newText = text.replaceRange(
      newStart,
      newEnd,
      '',
    );
    _textController.text = newText;
    _textController.selection = textSelection.copyWith(
      baseOffset: newStart,
      extentOffset: newStart,
    );
  }

  Widget _buildDialpad() {
    // * Label in button
    var labels = [
      [
        {'1': ''},
        {'2': 'abc'},
        {'3': 'def'}
      ],
      [
        {'4': 'ghi'},
        {'5': 'jkl'},
        {'6': 'mno'}
      ],
      [
        {'7': 'pqrs'},
        {'8': 'tuv'},
        {'9': 'wxyz'}
      ],
      [
        {'*': ''},
        {'0': '+'},
        {'#': ''}
      ],
    ];

    // * generate number buttons
    List<Widget> numberBtns = labels
        .map(
          (row) => Padding(
            padding: const EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: row
                  .map(
                    (label) => ActionButton(
                      title: label.keys.first,
                      subTitle: label.values.first,
                      onPressed: () => _handleNum(label.keys.first),
                      number: true,
                    ),
                  )
                  .toList(),
            ),
          ),
        )
        .toList();

    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        ),
        const Spacer(),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: numberBtns,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              width: 100,
              height: 60,
            ),
            _buidCallButton(context),
            // Container(
            //   width: 50,
            //   height: 50,
            //   color: Colors.red,
            // ),
            ActionButton(
              number: false,
              subTitle: '',
              icon: Icons.backspace,
              onPressed: () => _handleBackSpace(),
              // onLongPress: () => _handleBackSpace(true),
              backgroundColor: Colors.transparent,
            ),
            // Container(
            //   width: 50,
            //   height: 50,
            //   color: Colors.green,
            // ),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buidCallButton(BuildContext context) {
    return Container(
      height: 60.0, // height of the button
      decoration: const BoxDecoration(
        shape: BoxShape.circle, // shape makes the circular button
        gradient: LinearGradient(
          // gives the Gradient color
          colors: [
            Color.fromARGB(255, 2, 173, 102),
            Colors.blue,
          ],
        ),
      ),
      child: MaterialButton(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: const Icon(
          CupertinoIcons.phone_fill,
          size: 28,
          color: Colors.white,
        ),
        onPressed: () async {},
      ),
    );
  }

  void _handleNum(String number) {
    final text = _textController.text;
    final textSelection = _textController.selection;
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      number,
    );
    final myTextLength = number.length;
    _textController.text = newText;
    _textController.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PhysicalModel(
        // elevation: 4.0,
        color: Colors.transparent,
        // shadowColor: Colors.black,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 700, maxHeight: 600),
          decoration: BoxDecoration(
            // color: theme.menuColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1.0, color: borderColor),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  children: [
                    // * phone text box and search contact, customer
                    Expanded(
                      flex: 5,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          // color: Color.fromARGB(255, 207, 202, 202),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            topLeft: Radius.circular(12),
                          ),
                        ),
                        // border: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(12.0),
                        //   side: const BorderSide(
                        //     width: 0,
                        //     color: Colors.transparent,
                        //   ),
                        // ),
                        // borderRadius: BorderRadius.zero,
                        // borderColor: Colors.transparent,
                        // backgroundColor: theme.scaffoldBackgroundColor,
                        padding: const EdgeInsets.all(0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 40,
                                width: 300,
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 40,
                                child: TextField(
                                  // focusNode: tfFocusNode,
                                  autofocus: true,
                                  showCursor: true,
                                  controller: _textController,
                                  // style: theme.typography.title,
                                  textAlign: TextAlign.start,
                                  expands: false,
                                  // placeholder:
                                  //     'LocaleKeys.dial_enterPhoneNumber.tr()',
                                  onChanged: (text) {
                                    validateInput(text);
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        top: 0, bottom: 0, left: 8, right: 26),
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                      borderSide: BorderSide(
                                        width: .5,
                                        color: borderColor,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: .5,
                                        color: borderColor,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                  ),
                                  // BoxDecoration(
                                  //   color: Colors.transparent,
                                  //   border: Border.all(
                                  //     color: Colors.transparent,
                                  //     width: 0,
                                  //   ),
                                  // ),
                                  // onSubmitted: (value) {
                                  //   if (_textController.text != '') {
                                  //     appData.makeCallDial(
                                  //         phoneNumber: _textController.text);
                                  //     Navigator.of(context).pop();
                                  //   } else {
                                  //     flyoutController.showFlyout(
                                  //       autoModeConfiguration:
                                  //           FlyoutAutoConfiguration(
                                  //         preferredMode:
                                  //             FlyoutPlacementMode.topCenter,
                                  //       ),
                                  //       barrierDismissible: true,
                                  //       dismissOnPointerMoveAway: true,
                                  //       dismissWithEsc: true,
                                  //       builder: (context) {
                                  //         return FlyoutContent(
                                  //           child: Padding(
                                  //             padding:
                                  //                 const EdgeInsets.all(8.0),
                                  //             child: Text(
                                  //               LocaleKeys.app_noPhoneEnter
                                  //                   .tr(),
                                  //               style:
                                  //                   theme.typography.bodyStrong,
                                  //             ),
                                  //           ),
                                  //         );
                                  //       },
                                  //     );
                                  //   }
                                  // },
                                ),
                              ),
                              const SizedBox(height: 20),
                              // Expanded(child: _buildSearchResult()),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // * dialpad
                    Expanded(
                      flex: 5,
                      child: Stack(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(155, 235, 233, 233),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            // border: Border.all(
                            //   width: 0,
                            //   color: Colors.transparent,
                            // ),
                            // border: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(12.0),
                            //   side: const BorderSide(
                            //     width: 0,
                            //     color: Colors.transparent,
                            //   ),
                            // ),
                            // borderRadius: BorderRadius.zero,
                            // borderColor: Colors.transparent,
                            // backgroundColor:
                            //     theme.resources.solidBackgroundFillColorBase,
                            child: _buildDialpad(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // if (showSelectHotline)
              //   Button(
              //     style: ButtonStyle(
              //         padding: ButtonState.all(
              //           const EdgeInsets.all(0),
              //         ),
              //         backgroundColor: ButtonState.all(Colors.transparent),
              //         border: ButtonState.all(BorderSide.none)),
              //     child: Container(
              //       width: 1800,
              //       height: 700,
              //       color: Colors.transparent,
              //     ),
              //     onPressed: () {
              //       setState(() {
              //         showSelectHotline = false;
              //       });
              //     },
              //   ),
              // * select hotline
              const SizedBox(
                width: 350,
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SelectHotlineCallPhoneWidget()
                    // DialpadHotlineButton(
                    //   showWidget: showSelectHotline,
                    //   isShow: () {
                    //     setState(() {
                    //       showSelectHotline = !showSelectHotline;
                    //     });
                    //   },
                    // ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
