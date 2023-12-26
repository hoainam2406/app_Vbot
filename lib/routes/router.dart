import 'package:app_vbot/app/pages/CRM/customer_detail_page.dart';
import 'package:app_vbot/app/navigation/scaffold_with_nested_navigation.dart';
import 'package:app_vbot/app/pages/contacts/contacts.dart';
import 'package:app_vbot/app/pages/CRM/CRM_page.dart';
import 'package:app_vbot/app/pages/features/feature_page.dart';
import 'package:app_vbot/app/pages/historycall/history_call_detail.dart';
import 'package:app_vbot/app/pages/historycall/history_call_page.dart';
import 'package:app_vbot/app/pages/login/login_page.dart';
import 'package:app_vbot/app/pages/members/group/group_member_detail_page.dart';
import 'package:app_vbot/app/pages/members/group/group_member_page.dart';
import 'package:app_vbot/app/pages/members/member/List_member_page.dart';
import 'package:app_vbot/app/pages/members/member/member_detail_page.dart';
import 'package:app_vbot/app/pages/permission/permission_page.dart';
import 'package:app_vbot/app/pages/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorLoginKey = GlobalKey<NavigatorState>(debugLabel: 'login');
final _shellNavigatorhistoryCallKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellhistoryCall');
final _shellNavigatorContactKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellContact');
final _shellNavigatorFeatureKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellFeature');
final _shellNavigatorSettingKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellSetting');

final goRouter = GoRouter(
  initialLocation: '/historyCall',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorhistoryCallKey,
          routes: [
            GoRoute(
              path: '/historyCall',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HistoryCallPage(detailsPath: '/historyCall/details'),
              ),
              routes: [
                GoRoute(
                  path: 'details',
                  builder: (context, state) => const HistoryCallDetail(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorContactKey,
          routes: [
            GoRoute(
              path: '/contact',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ContactPage(),
              ),
              routes: [
                GoRoute(
                  path: 'details',
                  builder: (context, state) => const SettingsPage(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorFeatureKey,
          routes: [
            GoRoute(
              path: '/feature',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: FeaturePage(),
              ),
              routes: [
                GoRoute(
                  path: 'crm',
                  builder: (context, state) => const CRMPage(),
                  routes: [
                    GoRoute(
                      path: 'detail/:id',
                      builder: (context, state) => CustomerDetailPage(
                          content: state.pathParameters['id']),
                    ),
                  ],
                ),
                GoRoute(
                  path: 'permission',
                  builder: (context, state) => const PermissionPage(),
                ),
                GoRoute(
                  path: 'members',
                  builder: (context, state) => const ListMemberPage(),
                  routes: [
                    GoRoute(
                      path: 'detail/:id',
                      builder: (context, state) => MemberDetailPage(
                          content: state.pathParameters['id'] ?? ''),
                    ),
                  ],
                ),
                GoRoute(
                  path: 'groupmembers',
                  builder: (context, state) => const GroupMemberPage(),
                  routes: [
                    GoRoute(
                      path: 'detail/:id',
                      builder: (context, state) => GroupMemeberDetailPage(
                          content: state.pathParameters['id'] ?? ''),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorSettingKey,
          routes: [
            GoRoute(
              path: '/setting',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SettingsPage(),
              ),
              routes: [
                GoRoute(
                  path: 'details',
                  builder: (context, state) => const SettingsPage(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorLoginKey,
          routes: [
            GoRoute(
              path: '/login',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: Login(),
              ),
              // routes: [
              //   GoRoute(
              //     path: 'details',
              //     builder: (context, state) => const HistoryCallDetail(),
              //   ),
              // ],
            ),
          ],
        ),
      ],
    ),
  ],
);
