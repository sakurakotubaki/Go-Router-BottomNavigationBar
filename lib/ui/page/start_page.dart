import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('StartPage'),
            TextButton(
              onPressed: () {
                // Startページのネストしたルートのページ.
                GoRouter.of(context).go('/s');
              },
              child: const Text('ネストしたページ'),
            ),
            TextButton(
              onPressed: () {
                // Startページのネストしたルートのページ.
                context.go('/z');
              },
              child: const Text('fullScreen'),
            ),
            TextButton(
              onPressed: () {
                // BottomNavigationBarの最初のページへ画面遷移するコード.
                context.go('/a');
              },
              child: const Text('BottomNavigationBar'),
            ),
          ],
        ),
      ),
    );
  }
}
