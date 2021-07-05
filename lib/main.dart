import 'provider/CountProvider.dart';
import 'package:provider/provider.dart';

import 'pages/FormPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/Home.dart';
import 'pages/TabBarControlerPage.dart';
import 'pages/CategoryPage.dart';
import 'pages/user/Login.dart';
import 'pages/user/Register.dart';
import 'pages/Tabs.dart';
import 'pages/AppBarPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(
        // 但数据提供公共数据
        // ChangeNotifierProvider(
        //     create: (context) => CountProvider(),
        //     child: MyApp()
        // ),
        //  多数据提供
        MultiProvider(
          providers: [
            // 数组中添加提供的数据
            ChangeNotifierProvider(
              create: (context) => CountProvider(),
            ),
          ],
          child: MyApp(),
        ));

class MyApp extends StatelessWidget {
  final Map<String, Function> routes = {
    '/': (context, {arguments}) => Tabs(),
    '/form': (context, {arguments}) => FormPage(),
    '/categoryPage': (context, {arguments}) => CategoryPage(),
    '/loginPage': (context) => LoginPage(),
    '/registerPage': (context) => RegisterPage(),
    '/appBarPage': (context) => AppBarDemoPage(),
    '/tabBarControlPage': (context) => TabBarControlerPage(),
  };

  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'), //
        const Locale('en', 'US'), // English
        // ... other locales the app supports
      ],
      // debugShowCheckedModeBanner: false, //控制显示debug图标
      // home: Tabs(),
      routes: {
        '/login': (context) => LoginPage(),
        '/formPage': (context) => FormPage(),
        '/tabBarControlPage': (context) => TabBarControlerPage(),
      },
      onGenerateRoute: (RouteSettings settings) {
        // String? name;
        print(settings);
        if (settings.name != null) {
          final String? name = settings.name;
          // final args = settings.arguments;
          final Function pageContentBuilder = this.routes[name] as Function;

          if (settings.arguments != null) {
            print('有arg');
            final Route route = MaterialPageRoute(
                builder: (context) =>
                    pageContentBuilder(context, arguments: settings.arguments));
            return route;
          } else {
            print('无arg');
            final Route route = MaterialPageRoute(
                builder: (context) => pageContentBuilder(context));
            return route;
          }
        }
      },
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
    );
  }
}

// 有状态组件
class StateFullPage extends StatefulWidget {
  const StateFullPage({Key? key}) : super(key: key);

  @override
  _StateFullPageState createState() => _StateFullPageState();
}

class _StateFullPageState extends State<StateFullPage> {
  int contNum = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Chip(label: Text('${this.contNum}')),
        ElevatedButton(
          onPressed: () {
            setState(() {
              this.contNum++;
            });
          },
          child: Text('点我'),
        ),
        Home(),
        // RaisedButton(onPressed: () {},child: Text('Raised'),),
      ],
    );
  }
}

class LayoutWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        ButtonCon(),
        ButtonCon(),
        ButtonCon(),
        ButtonCon(),
        ButtonCon(),
        ButtonCon(),
        ButtonCon(),
        ButtonCon(),
      ],
    );
  }
}

class ButtonCon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text('点击'),
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red)));
  }
}

class LayoutCard1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    'https://www.itying.com/images/flutter/1.png',
                    fit: BoxFit.cover,
                  )),
              ListTile(
                // leading: ClipOval(
                //     child: Image.network(
                //   'https://www.itying.com/images/flutter/1.png',
                //   fit: BoxFit.cover,
                //       width: 50,
                //       height: 50,
                // )),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.itying.com/images/flutter/1.png'),
                ),
                title: Text('标题'),
                subtitle: Text('子标题'),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class LayoutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          margin: EdgeInsets.all(10),
          // shape: ,
          child: Column(
            children: [
              ListTile(
                title: Text(
                  '高绍云',
                  style: TextStyle(fontSize: 24),
                ),
                subtitle: Text('高级工程师'),
              ),
              ListTile(
                title: Text(
                  '132****2345',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class LayoutPosition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 400,
        color: Colors.teal,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              child: Text(
                'positioned',
                style: TextStyle(fontSize: 30, color: Colors.yellow),
              ),
              bottom: 0,
              left: 50,
            )
          ],
        ),
      ),
    );
  }
}

class LayoutStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: Alignment.bottomCenter,
      alignment: Alignment(0, 0),
      children: [
        Container(
          // height: 400,
          // width: 300,
          color: Colors.deepOrange,
        ),
        Text(
          'stack的使用',
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Align使用',
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
        )
      ],
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Image.network(
            'https://www.itying.com/images/flutter/1.png',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Image.network(
            'https://www.itying.com/images/flutter/1.png',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Image.network(
            'https://www.itying.com/images/flutter/1.png',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Image.network(
            'https://www.itying.com/images/flutter/1.png',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Image.network(
            'https://www.itying.com/images/flutter/1.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
    ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Image.network(
          'https://www.itying.com/images/201906/thumb_img/1120_thumb_G_1560842703267.jpg',
          width: 200,
        ),
        Image.network(
          'https://www.itying.com/images/201906/thumb_img/1120_thumb_G_1560842703267.jpg',
          width: 200,
        ),
        Image.network(
          'https://www.itying.com/images/201906/thumb_img/1120_thumb_G_1560842703267.jpg',
          width: 200,
        ),
        Image.network(
          'https://www.itying.com/images/201906/thumb_img/1120_thumb_G_1560842703267.jpg',
          width: 200,
        ),
      ],
    );
    ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        ListTile(
          leading: Icon(
            Icons.favorite,
            color: Colors.pink,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
          title: Text('1'),
          subtitle: Text('副标题'),
        ),
        ListTile(
          title: Text('2'),
        ),
        ListTile(
          title: Text('3'),
        ),
        ListTile(
          title: Text('4'),
        ),
      ],
    );
    Center(
        child: Container(
      child: Text(
        '哈哈哈',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 32.0,
          color: Colors.yellowAccent,
        ),
      ),
      height: 300.0,
      width: 300.0,
      decoration: BoxDecoration(
          color: Colors.yellow,
          border: Border.all(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(10))),
    ));
  }
}
