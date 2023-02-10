import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartDetail extends StatelessWidget {
  const StartDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'StartPage詳細',
              style: TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}
