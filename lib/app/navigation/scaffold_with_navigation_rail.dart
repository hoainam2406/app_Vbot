import 'package:app_vbot/app/components/component.dart';
import 'package:app_vbot/app/pages/phones/Small_call_page.dart';
import 'package:app_vbot/app/pages/phones/app_dialpad.dart';
import 'package:app_vbot/app/pages/vpm_app_bar.dart';
import 'package:app_vbot/app/pages/windown_button.dart';
import 'package:app_vbot/app/widgets/app/signal_app.dart';
import 'package:app_vbot/app/widgets/dialog.dart';
import 'package:app_vbot/app/widgets/header_app.dart';
import 'package:app_vbot/app/widgets/historyCall/select_hotline_call_widget.dart';
import 'package:app_vbot/constant.dart';
import 'package:app_vbot/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:window_manager/window_manager.dart';

class ScaffoldWithNavigationRail extends StatefulWidget
    with GetItStatefulWidgetMixin {
  ScaffoldWithNavigationRail(
      {super.key,
      required this.body,
      required this.selectedIndex,
      required this.onDestinationSelected});

  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  State<ScaffoldWithNavigationRail> createState() =>
      _ScaffoldWithNavigationRailState();
}

class _ScaffoldWithNavigationRailState extends State<ScaffoldWithNavigationRail>
    with GetItStateMixin {
  AppService appData = GetIt.instance.get<AppService>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final direction = Directionality.of(context);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        toolbarHeight: 50,
        title: () {
          return const DragToMoveArea(child: HeaderApp());
        }(),
        actions: const [WindownButtons()],
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: widget.selectedIndex,
            onDestinationSelected: widget.onDestinationSelected,
            labelType: NavigationRailLabelType.all,
            unselectedLabelTextStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600),
            selectedLabelTextStyle: const TextStyle(
                color: Colors.green, fontWeight: FontWeight.w600),
            selectedIconTheme: const IconThemeData(
              color: Colors.green,
            ),
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(CupertinoIcons.clock),
                selectedIcon: Icon(
                  CupertinoIcons.clock_fill,
                ),
                label: Text('Lịch sử gọi'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.contacts_outlined),
                selectedIcon: Icon(
                  Icons.contacts,
                ),
                label: Text('Danh bạ'),
              ),
              NavigationRailDestination(
                icon: Icon(CupertinoIcons.rectangle_grid_2x2),
                selectedIcon: Icon(
                  CupertinoIcons.rectangle_grid_2x2_fill,
                ),
                label: Text('Chức năng'),
              ),
              NavigationRailDestination(
                icon: Icon(CupertinoIcons.gear_alt),
                selectedIcon: Icon(
                  CupertinoIcons.gear_alt_fill,
                ),
                label: Text('Cài đặt'),
              ),
            ],
          ),
          // const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 1),
              child: DecoratedBox(
                position: DecorationPosition.foreground,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: .3,
                      color: borderColor,
                    ),
                    borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(16.0),
                    ).resolve(direction),
                  ),
                ),
                child: ClipPath(
                  // clipBehavior: widget.clipBehavior,
                  clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: .3,
                        color: borderColor,
                      ),
                      borderRadius: const BorderRadiusDirectional.only(
                        topStart: Radius.circular(16.0),
                      ).resolve(direction),
                    ),
                  ),
                  child: widget.body,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
