import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageD extends StatelessWidget {
  const PageD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dページ'),
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              GoRouter.of(context).go('/d/dd');
            }, child: Text('詳細ページへ')),
      ),
    );
  }
}
