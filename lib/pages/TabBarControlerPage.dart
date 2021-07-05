import 'package:flutter/material.dart';

class TabBarControlerPage extends StatefulWidget {
  const TabBarControlerPage({Key? key}) : super(key: key);

  @override
  _TabBarControlerPageState createState() => _TabBarControlerPageState();
}

class _TabBarControlerPageState extends State<TabBarControlerPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {   // 生命周期函数
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);

    // 监听改变
    _tabController.addListener(() {
      print(_tabController.index);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tabBarCon'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: '第一个',),
            Tab(text: '第二个',),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text('11111111'),),
          Center(child: Text('2222222222'),),
        ],
      ),
    );
  }
}
