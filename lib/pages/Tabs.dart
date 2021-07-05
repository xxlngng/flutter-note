import 'package:flutter/material.dart';
import 'Setting.dart';
import 'Home.dart';
import 'tabs/GoodsPage.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int currentIndex = 0;
  List _pageList = [
    Home(),
    GoodsPage(),
    Setting()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('拉布拉多'),
      ),
      body: this._pageList[this.currentIndex],
      floatingActionButton: Container(
        width: 60,
        height: 60,
        margin: EdgeInsets.only(top:20),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: Colors.white,
        ),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: this.currentIndex == 1 ? Colors.yellow: Colors.red,
          onPressed: () {
            print('press');
            setState(() {
              this.currentIndex = 1;
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        // fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '首页'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.fmd_good),
              label: '商品'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '设置'
          )
        ],
        // type: BottomNavigationBarType.fixed,
        currentIndex: this.currentIndex,
        onTap: (int index) {
          setState(() {
            this.currentIndex = index;
          });
        },
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text('齐天大圣'), 
                accountEmail: Text('110.qq.com'),
              currentAccountPicture: Image.network('https://www.itying.com/images/flutter/1.png'),
              // currentAccountPictureSize: Size(100, 80),
              otherAccountsPictures: [
                Image.network('https://www.itying.com/images/flutter/2.png'),
                Image.network('https://www.itying.com/images/flutter/3.png'),
              ],
            )
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: DrawerHeader(
                      child: Text('个人中心'),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        image: DecorationImage(
                          image: NetworkImage('https://www.itying.com/images/flutter/1.png'),
                          fit: BoxFit.fill

                        )
                      ),
                    ),
                )
              ],
            ),

            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.people),
              ),
              title: Text('用户中心'),
            ),
            Divider(height: 10.0,),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.account_balance_wallet_sharp),
              ),
              title: Text('钱包'),
              onTap: () {
                Navigator.of(context).pop(); // 隐藏侧边栏
                Navigator.pushNamed(context, '/loginPage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
