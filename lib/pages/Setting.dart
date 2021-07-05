import 'package:flutter/material.dart';
import 'FormPage.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {


    return Center(
        child:Row(
          children: [
            MaterialButton(
              color: Colors.yellow,
              textColor: Colors.white,
              onPressed: () {
                print(333);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (builder) => FormPage(title: '提交表单'))
                );
              },
              child: Text('toForm'),
            ),
            SizedBox(width: 10,),
            ElevatedButton(
              // color: Colors.yellow,
              // textColor: Colors.white,
              onPressed: () {
                // Navigator.pushNamed(context, '/form', arguments: {'id':'121'});

                Navigator.pushNamed(context, '/formPage');
                // Navigator.pushNamed(context, '/form', );
              },

              child: Text('路由'),
            ),
            SizedBox(width: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/loginPage');
              },
              child: Text('登陆'),
            ),
            SizedBox(width: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/registerPage');
              },
              child: Text('注册'),
            ),
          ],
        )


    );
  }
}
