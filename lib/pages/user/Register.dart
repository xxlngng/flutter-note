import 'package:flutter/material.dart';
import '../CategoryPage.dart';
import '../Tabs.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('注册页面'),
            ElevatedButton(onPressed: () {
              Navigator.pushReplacementNamed(context, '/loginPage');
            }, child: Text('去登陆')),
            ElevatedButton(onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(builder: (context) => new Tabs()),
                      (route) => false);
            }, child: Text('返回根')),

          ],
        ),
      ),
    );
  }
}
