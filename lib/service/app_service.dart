import 'package:app_vbot/app/pages/phones/noti_call_page.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => AppService());
}

class AppService extends ChangeNotifier {
  late BuildContext context;

  bool isLogout = false;
  setIsLogout(bool logout) {
    isLogout = logout;
    notifyListeners();
  }

  resetIsLogout() {
    isLogout = false;
    notifyListeners();
  }

  // show small call
  bool showSmallCall = false;
  setShowSmallCall(bool show) {
    showSmallCall = show;
    notifyListeners();
  }

  // answer call
  bool answer = false;
  setAnswerCall(bool value) {
    answer = value;
    notifyListeners();
  }

  // index page
  bool indexPage = false;
  setIndexPage(bool index) {
    indexPage = index;
    notifyListeners();
  }

  // end call
  bool endCall = false;
  setEndCall(bool end) {
    endCall = end;
    notifyListeners();
  }

  // show dialog call
  void showDialogCall() {
    showCallAppDialog(
      child: const NotiCallPage(),
      context: context,
      // onDialogDismiss: () {
      //   // if (endCall == false) {
      //   //   appData.setShowSmallCall(true);
      //   //   // appData.setEndCall(true);
      //   //   print('nam log 1');
      //   // } else {
      //   //   appData.setShowSmallCall(false);
      //   //   appData.setEndCall(false);
      //   //   print('nam log 2');
      //   // }
      // },
    );
  }
}
