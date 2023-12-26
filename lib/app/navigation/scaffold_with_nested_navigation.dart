import 'package:app_vbot/app/navigation/scaffold_with_navigation_rail.dart';
import 'package:app_vbot/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:go_router/go_router.dart';

// class ScaffoldWithNestedNavigation extends StatelessWidget {
//   const ScaffoldWithNestedNavigation({
//     Key? key,
//     required this.navigationShell,
//   }) : super(
//             key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));
//   final StatefulNavigationShell navigationShell;

// void _goBranch(int index) {
//   navigationShell.goBranch(
//     index,
//     initialLocation: index == navigationShell.currentIndex,
//   );
// }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constraints) {
//       return ScaffoldWithNavigationRail(
//         body: navigationShell,
//         selectedIndex: navigationShell.currentIndex,
//         onDestinationSelected: _goBranch,
//       );
//     });
//   }
// }

class ScaffoldWithNestedNavigation extends StatefulWidget
    with GetItStatefulWidgetMixin {
  ScaffoldWithNestedNavigation({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNestedNavigation> createState() =>
      _ScaffoldWithNestedNavigationState();
}

class _ScaffoldWithNestedNavigationState
    extends State<ScaffoldWithNestedNavigation> with GetItStateMixin {
  StatefulNavigationShell get navigationShell => widget.navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    // var isLogout = watchOnly((AppService x) => x.isLogout);
    return LayoutBuilder(
      builder: (context, constraints) {
        return ScaffoldWithNavigationRail(
          body: navigationShell,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _goBranch,
        );
      },
    );
  }
}
