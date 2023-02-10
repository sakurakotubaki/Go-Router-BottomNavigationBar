import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('詳細ページ'),
      ),
      body: Center(
          child: Text(
        '詳細ページ!',
        style: TextStyle(fontSize: 50, color: Colors.indigoAccent),
      )),
    );
  }
}
