import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class FormPage extends StatefulWidget {
  String title;

  final arguments;

  FormPage({Key? key, this.title = '表单', this.arguments}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  var _username = new TextEditingController();
  var check = true;
  var rad;
  bool flag = true;
  var _nowDate = DateTime.now();
  var _nowTime = TimeOfDay(hour: 12, minute: 11);

  _showDatePicker() {
    // 打开时间面板
    showDatePicker(
            context: context,
            initialDate: _nowDate,
            firstDate: DateTime(1980),
            lastDate: DateTime(2050),
            locale: Locale('zh'))
        .then((res) {
      // 也可以用 async await
      print(res);
      setState(() {
        this._nowDate = res!;
      });
    });
  }

  _showTimePicker() async {
    var rest = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: 11, minute: 11),
        helpText: '时间'
    );
    print(rest);
    setState(() {
      _nowTime = rest!;
    });
  }

  @override
  void initState() {
    _username.text = '许先';
    print(_nowDate.millisecondsSinceEpoch); // 时间戳 1625123425000
    print(DateTime.fromMillisecondsSinceEpoch(
        1625123425000)); //转日期2021-07-01 07:10:25.561
    print(formatDate(DateTime(1989, 2, 21), [yyyy, '-', mm, '-', dd]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('表单'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: '用户名'),
              controller: _username,
              onChanged: (value) {
                setState(() {
                  _username.text = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print(_username.text);
                },
                child: Text('登陆'),
              ),
            ),
            Checkbox(
                value: this.check,
                onChanged: (v) {
                  print(v);
                  setState(() {
                    this.check = v!;
                  });
                }),
            CheckboxListTile(
              value: this.check,
              onChanged: (v) {
                setState(() {
                  this.check = v!;
                });
              },
              title: Text('标题'),
              subtitle: Text('二级标题'),
              secondary: Icon(Icons.help), //设置图标
            ),
            Row(
              children: [
                Text('男'),
                Radio(
                    value: 1,
                    groupValue: this.rad,
                    onChanged: (v) {
                      setState(() {
                        this.rad = v;
                      });
                    }),
                Text('女'),
                Radio(
                    value: 2,
                    groupValue: this.rad,
                    onChanged: (v) {
                      print(v);
                      setState(() {
                        this.rad = v;
                      });
                    }),
              ],
            ),
            RadioListTile(
              value: 1,
              onChanged: (v) {
                setState(() {
                  this.rad = v;
                });
              },
              groupValue: this.rad,
              title: Text('标题'),
              subtitle: Text('二级标题'),
              secondary: Icon(Icons.help), //可以放图片
            ),
            RadioListTile(
              value: 2,
              onChanged: (v) {
                setState(() {
                  this.rad = v;
                });
              },
              groupValue: this.rad,
              title: Text('标题'),
              subtitle: Text('二级标题'),
              secondary: Icon(Icons.help), //设置
            ),
            Switch(
                value: this.flag,
                onChanged: (v) {
                  print(v);
                  setState(() {
                    this.flag = v;
                  });
                }),
            InkWell(
              child: Row(
                children: [
                  Text(
                      '${formatDate(this._nowDate, [yyyy, '-', mm, '-', dd])}'),
                  Icon(Icons.arrow_drop_down_circle_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        Text('${this._nowTime.format(context)}'),
                        Icon(Icons.arrow_drop_down_circle_outlined)
                      ],
                    ),
                    onTap: () {
                      print('open');
                      _showTimePicker();
                    },
                  ),
                ],
              ),
              onTap: () {
                print('open');
                _showDatePicker();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FormFileDemo extends StatelessWidget {
  const FormFileDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
              icon: Icon(Icons.people),
              hintText: '这是placeholder',
              border: OutlineInputBorder()),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          obscureText: true, // 设置密码框
          decoration: InputDecoration(
              hintText: '密码', border: OutlineInputBorder(), labelText: '密码'),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          maxLines: 2,
          decoration:
              InputDecoration(hintText: '多行文本', border: OutlineInputBorder()),
        ),
      ],
    );
  }
}

// class FormFileDemo extends StatelessWidget {
//   String title ;
//   final arguments;
//
//   FormFileDemo({Key? key, this.title= '表单', this.arguments}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         child: Text('返回'),
//         onPressed: () {
//           Navigator.of(context).pop();
//         },
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       appBar: AppBar(
//         title: Text('${this.title}'),
//       ),
//       body: Text("表单${arguments!=null?arguments['id']: '1221'}"),
//     );
//   }
// }
