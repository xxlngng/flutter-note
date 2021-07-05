import 'package:fluter1/pages/AppBarPage.dart';
import 'package:flutter/material.dart';

class GoodsPage extends StatelessWidget {
  const GoodsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          // floatingActionButton: FloatingActionButton(
          //   child: Text('返回'),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
          appBar: AppBar(
              // title: Text('appbar'),
              // centerTitle: true,
              // leading: IconButton(
              //   icon: Icon(Icons.menu),
              //   onPressed: () {
              //     Navigator.of(context).pop();
              //   },
              // ),
              // actions: [
              //   IconButton(
              //       onPressed: () {
              //         print('search');
              //       },
              //       icon: Icon(Icons.search))
              // ],
            title: Row(
              children: [
                Expanded(child: TabBar(
                  // isScrollable: true, //可以滚动
                  tabs: [
                    Tab(text: '热门'),
                    Tab(text: '推荐'),
                  ],
                ))
              ],
            ),
              // bottom: TabBar(
              //   tabs: [
              //     Tab(text: '热门'),
              //     Tab(text: '推荐'),
              //   ],
              // )
          ),

          body: TabBarView(
              children: [
                ListView(
                  children: [
                    ListTile(
                      title: Text('第一个'),
                    ),ListTile(
                      title: Text('第2个'),
                    ),
                  ],
                ),
                ListView(
                  children: [
                    ListTile(
                      title: Text('第一个'),
                    ),ListTile(
                      title: Text('第2个'),
                    ),
                  ],
                ),
              ]

          ),
        ));
  }
}
// class GoodsPage extends StatefulWidget {
//   const GoodsPage({Key? key}) : super(key: key);
//
//   @override
//   _GoodsPageState createState() => _GoodsPageState();
// }
//
// class _GoodsPageState extends State<GoodsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Text('data');
//   }
// }

