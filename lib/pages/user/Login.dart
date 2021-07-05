import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  String title ;
  final arguments;

  LoginPage({Key? key, this.title= '表单', this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登陆'),
      ),
      body: Center(
        child: Column(
          children: [
            // ElevatedButton(onPressed: () {}, child: Text('登陆'))
            Text('登陆页面'),
            ElevatedButton(onPressed: () {
              Navigator.of(context).pop();
            }, child: Text('登陆成功'))
          ],
        ),
      ),
    );
  }
}
