// Copyright 2013 The Flutter Authors. All rights reserved.
// このソースコードの使用は、BSDスタイルのライセンスによって管理されます。
// LICENSE ファイルに記載されています。

import 'package:flutter/material.dart';
import 'package:go_route_navigationbar/router/router.dart';
import 'package:go_router/go_router.dart';

// このシナリオは、ShellRoute を使用してネストされたナビゲーションをセットアップする方法を示します。
// これは、追加のナビゲータをウィジェットツリーに配置し、ルートナビゲータの代わりに使用するパターンです。
// ルートナビゲータの代わりに使用するパターンです。これにより、ディープリンクで
//これは、ルートナビゲータの代わりに、ウィジェットツリーに追加のナビゲータを配置するパターンです。

// この例では、ShellRouteの中にルートを表示し、また、別のナビゲータ（ルートNavigatorなど）を使用して画面をプッシュする方法を示しています。
// 別のナビゲータ(ルートNavigatorなど)を使って画面をプッシュする方法を示します。
// `parentNavigatorKey` を提供します。

void main() {
  runApp(ShellRouteExampleApp());
}

/// An example demonstrating how to use [ShellRoute]
class ShellRouteExampleApp extends StatelessWidget {
  /// Creates a [ShellRouteExampleApp]
  ShellRouteExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: goRouter,
    );
  }
}
