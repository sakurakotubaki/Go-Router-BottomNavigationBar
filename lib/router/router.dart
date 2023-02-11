import 'package:flutter/material.dart';
import 'package:go_route_navigationbar/ui/navigation/page/ScreenD.dart';
import 'package:go_route_navigationbar/ui/navigation/page/detail/DetailPage.dart';
import 'package:go_route_navigationbar/ui/navigation/page/detail/detail_screen.dart';
import 'package:go_route_navigationbar/ui/navigation/page/screenA.dart';
import 'package:go_route_navigationbar/ui/navigation/page/screenB.dart';
import 'package:go_route_navigationbar/ui/navigation/page/screenC.dart';
import 'package:go_route_navigationbar/ui/navigation/scafflod_with_navbar.dart';
import 'package:go_route_navigationbar/ui/page/start_datil.dart';
import 'package:go_route_navigationbar/ui/page/start_page.dart';
import 'package:go_router/go_router.dart';

// GlobalKeyを使用してボトムナビゲーションバーのWidgetにアクセスできるようにする.
final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    /// ボトムナビゲーションバーとは違うルート.
    /// [ここから]
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return StartPage();
      },
      routes: <RouteBase>[
        GoRoute(
              path: 's',
              builder: (BuildContext context, GoRouterState state) {
                return const StartDetail();
              },
            ),
        GoRoute(
              path: 'z',
              pageBuilder: (context, state) => const MaterialPage(
                fullscreenDialog: true,
                child: StartDetail())
            ),
      ]
    ),
    /// [ここまで]
    // -----------------------------------------------------------------
    /// アプリケーションシェル
    /// この中にボトムナビゲーションバーする設定を書く.
    /// [ここから]
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: <RouteBase>[
        /// 下部のナビゲーションバーに最初に表示される画面.
        GoRoute(
          path: '/a',
          builder: (BuildContext context, GoRouterState state) {
            return const ScreenA();
          },
          routes: <RouteBase>[
            // 内側のナビゲータに重ねて表示する詳細画面。
            // これは画面Aをカバーするが、アプリケーションシェルはカバーしない。
            GoRoute(
              path: 'details',
              builder: (BuildContext context, GoRouterState state) {
                return const DetailsScreen(label: 'A');
              },
            ),
          ],
        ),

        /// 下のナビゲーションバーで2番目の項目が選択されたときに表示されます。
        /// 表示されます。
        GoRoute(
          path: '/b',
          builder: (BuildContext context, GoRouterState state) {
            return const ScreenB();
          },
          routes: <RouteBase>[
            /// "/a/details "と同じですが、ルートNavigatorに表示させるために
            /// parentNavigatorKey]を指定することで、ルートNavigatorに表示されます。これは画面Bとアプリケーションシェルの両方をカバーします。
            /// アプリケーションシェルをカバーします。
            GoRoute(
              path: 'details',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                return const DetailsScreen(label: 'B');
              },
            ),
          ],
        ),

        /// 下部のナビゲーションバーに表示される3つ目の画面。
        GoRoute(
          path: '/c',
          builder: (BuildContext context, GoRouterState state) {
            return const ScreenC();
          },
          routes: <RouteBase>[
            // 内側のナビゲータに重ねて表示する詳細画面。
            // これは画面Aをカバーするが、アプリケーションシェルはカバーしない。
            GoRoute(
              path: 'details',
              builder: (BuildContext context, GoRouterState state) {
                return const DetailsScreen(label: 'C');
              },
            ),
          ],
        ),

        /// 下部のナビゲーションバーに表示される3つ目の画面。
        GoRoute(
          path: '/d',
          builder: (BuildContext context, GoRouterState state) {
            return const PageD();
          },
          routes: <RouteBase>[
            // 内側のナビゲータに重ねて表示する詳細画面。
            // これは画面Aをカバーするが、アプリケーションシェルはカバーしない。
            GoRoute(
              path: 'dd',
              builder: (BuildContext context, GoRouterState state) {
                return const DetailPage();
              },
            ),
          ],
        ),
      ],
    ),
    /// [ここまで]
  ],
);
