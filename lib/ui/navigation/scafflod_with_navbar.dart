import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// を持つScaffoldを構築することによって、アプリの「シェル」を構築します。
/// BottomNavigationBarを構築し、[child]はScaffoldの本体に配置されます。
class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.child,
    Key? key,
  }) : super(key: key);

  /// Scaffoldのボディに表示するウィジェットです。
  /// このサンプルではNavigatorです。
  final Widget child;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'A Screen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'B Screen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important_rounded),
            label: 'C Screen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'D Screen',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith('/a')) {
      return 0;
    }
    if (location.startsWith('/b')) {
      return 1;
    }
    if (location.startsWith('/c')) {
      return 2;
    }
    // 追加したコード。0から数えて追加するみたいです.
    if (location.startsWith('/d')) {
      return 3;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/a');
        break;
      case 1:
        GoRouter.of(context).go('/b');
        break;
      case 2:
        GoRouter.of(context).go('/c');
        break;
      // 追加したコード
      case 3:
        GoRouter.of(context).go('/d');
        break;
    }
  }
}
